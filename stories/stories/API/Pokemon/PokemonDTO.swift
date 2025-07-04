//
//  PokemonDTO.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

struct PokemonDTO: Decodable {
    let name: String
    let sprite: String
    
    enum PokemonCodingKeys: String, CodingKey {
        case name, sprites
    }
    
    enum SpriteCodingKeys: String, CodingKey {
        case front = "front_default"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: PokemonCodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        
        let spritesContainer = try container.nestedContainer(keyedBy: SpriteCodingKeys.self, forKey: .sprites)
        sprite = try spritesContainer.decode(String.self, forKey: .front)
    }
    
    init(name: String, sprite: String) {
        self.name = name
        self.sprite = sprite
    }
}
