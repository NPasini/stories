//
//  DTOMapper.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

enum DTOMapper {
    static func map<DTO: Decodable>(_ data: Data) throws -> DTO {
        guard let dto = try? JSONDecoder().decode(DTO.self, from: data) else {
            throw APIError.invalidData
        }
        
        return dto
    }
}
