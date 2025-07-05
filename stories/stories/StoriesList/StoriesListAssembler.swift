//
//  StoriesListAssembler.swift
//  stories
//
//  Created by nicolo.pasini on 05/07/25.
//

import SwiftUI

struct StoriesListAssembler {
    private let userDefaults: UserDefaults
    private let httpClient: HTTPClientProtocol
    private let jsonReader: JsonReaderProtocol
    
    func assemble() -> AnyView {
        AnyView(
            StoriesView(
                viewModel: StoriesViewModel(repository: makeStoriesRepository()),
                storyViewPersister: makeStoryViewsPersister(),
                favouritesPersister: makeFavouritesPersister()
            )
        )
    }
    
    init(userDefaults: UserDefaults, httpClient: HTTPClientProtocol, jsonReader: JsonReaderProtocol) {
        self.userDefaults = userDefaults
        self.httpClient = httpClient
        self.jsonReader = jsonReader
    }
}

private extension StoriesListAssembler {
    func makeStoriesRepository() -> StoriesRepository {
        StoriesRepository(
            userDataSource: UserDataSource(dataReader: jsonReader),
            pokemonDataSource: PokemonRemoteDataSource(httpClient: httpClient)
        )
    }
    
    func makeStoryViewsPersister() -> UserDefaultsStorage {
        StoryViewUserDefaultsStorage(userDefaultsSuite: userDefaults)
    }
    
    func makeFavouritesPersister() -> UserDefaultsStorage {
        FavouritesUserDefaultsStorage(userDefaultsSuite: userDefaults)
    }
}
