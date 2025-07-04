//
//  StoriesRepository.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

protocol StoriesRepositoryProtocol {
    func loadMoreStories() async -> [Story]
}

class StoriesRepository {
    private var page: Int = 0
    private let userDataSource: UserDataSourceProtocol
    private let pokemonDataSource: PokemonRemoteDataSourceProtocol
    
    private enum Error: Swift.Error {
        case invalidStory
    }
    
    init(userDataSource: UserDataSourceProtocol, pokemonDataSource: any PokemonRemoteDataSourceProtocol) {
        self.userDataSource = userDataSource
        self.pokemonDataSource = pokemonDataSource
    }
}

extension StoriesRepository: StoriesRepositoryProtocol {
    func loadMoreStories() async -> [Story] {
        do {
            let newUsers = try userDataSource.getUsers(atPage: page)
            page += 1
            
            return try await withThrowingTaskGroup(of: Story.self) { group in
                var stories = [Story]()
                
                newUsers.forEach { user in
                    group.addTask { try await self.loadStory(forUser: user) }
                }
                
                defer {
                    group.cancelAll()
                }
                
                while let story = try await group.next() {
                    stories.append(story)
                }
                
                return stories
            }
        } catch {
            return []
        }
    }
}

private extension StoriesRepository {
    func loadStory(forUser user: UserDTO) async throws -> Story {
        let pokemon = try await pokemonDataSource.fetchData(for: user.id)
        guard let story = Story(
            imageUrl: pokemon.sprite,
            userName: user.name,
            userImageUrl: user.profile_picture_url
        ) else { throw Error.invalidStory }
        return story
    }
}
