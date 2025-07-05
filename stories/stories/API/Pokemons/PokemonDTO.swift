//
//  PokemonDTO.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

struct PokemonDTO: Decodable {
    let id: Int
    let name: String
    let sprite: String
    
    enum PokemonCodingKeys: String, CodingKey {
        case id, name, sprites
    }
    
    enum SpriteCodingKeys: String, CodingKey {
        case front = "front_default"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: PokemonCodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        
        let spritesContainer = try container.nestedContainer(keyedBy: SpriteCodingKeys.self, forKey: .sprites)
        sprite = try spritesContainer.decode(String.self, forKey: .front)
    }
}
