//
//  storiesApp.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import SwiftUI

@main
struct storiesApp: App {
    private let userDataSource: UserDataSource
    private let httpClient: URLSessionHTTPClient
    
    var body: some Scene {
        WindowGroup {
            StoriesView(
                viewModel: StoriesViewModel(
                    repository: StoriesRepository(
                        userDataSource: userDataSource,
                        pokemonDataSource: PokemonRemoteDataSource(httpClient: httpClient)
                    )
                ),
                storyViewPersister: ,
                favouritesPersister: 
            )
        }
    }
    
    init() {
        httpClient = URLSessionHTTPClient()
        userDataSource = UserDataSource(dataReader: JsonReader())
    }
}
