//
//  PokemonDTOTests.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation
@testable import stories
import Testing

struct PokemonDTOTests {
    @Test
    func listDTOParsing() throws {
        let data = try JsonReader.dataFromFile(named: "pokemon")
        let pokemon: PokemonDTO = try DTOMapper.map(data)
        
        #expect(pokemon.name == "bulbasaur")
        #expect(pokemon.sprite == "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")
    }
    
    @Test
    func listWithoutNameParsing() throws {
        let data = try JsonReader.dataFromFile(named: "pokemon_without_name")
        
        #expect(throws: APIError.invalidData, performing: {
            let _: PokemonDTO = try DTOMapper.map(data)
        })
    }
    
    @Test
    func listWithoutSpriteParsing() throws {
        let data = try JsonReader.dataFromFile(named: "pokemon_without_sprite")
        
        #expect(throws: APIError.invalidData, performing: {
            let _: PokemonDTO = try DTOMapper.map(data)
        })
    }
}
