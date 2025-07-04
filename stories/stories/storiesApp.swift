//
//  storiesApp.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import SwiftUI

@main
struct storiesApp: App {
    var body: some Scene {
        WindowGroup {
            StoriesScrollView(
                viewModel: StoriesViewModel(
                    repository: StoriesRepository(
                        userDataSource: UserDataSource(dataReader: JsonReader()),
                        pokemonDataSource: PokemonRemoteDataSource(httpClient: URLSessionHTTPClient())
                    )
                )
            )
        }
    }
}
