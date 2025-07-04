//
//  PokemonEndpoint.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

enum PokemonEndpoint {
    case get(number: Int)
    
    var url: URL {
        switch self {
        case .get(let number):
            var components = URLComponents()
            components.scheme = "https"
            components.host = "pokeapi.co"
            components.path = "/api/v2/pokemon/\(number)"
            return components.url!
        }
    }
}
