//
//  PokemonEndpointTests.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation
@testable import stories
import Testing

struct AssetsEndpointTests {
    @Test
    func getUrlIsCorrect() {
        #expect(PokemonEndpoint.get(number: 1).url == URL(string: "https://pokeapi.co/api/v2/pokemon/1")!)
        #expect(PokemonEndpoint.get(number: 3).url == URL(string: "https://pokeapi.co/api/v2/pokemon/3")!)
        #expect(PokemonEndpoint.get(number: 100).url == URL(string: "https://pokeapi.co/api/v2/pokemon/100")!)
    }
}
