//
//  PokemonRemoteDataSourceProtocol.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

protocol PokemonRemoteDataSourceProtocol {
    func fetchData(for pokemonNumber: Int) async throws -> PokemonDTO
}

struct PokemonRemoteDataSource: PokemonRemoteDataSourceProtocol {
    private let httpClient: HTTPClientProtocol
    
    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
    
    func fetchData(for pokemonNumber: Int) async throws -> PokemonDTO {
        try DTOMapper.map(
            try await httpClient.getData(from: PokemonEndpoint.get(number: pokemonNumber).url)
        )
    }
}
