//
//  URLSessionHTTPClient.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

class URLSessionHTTPClient: HTTPClientProtocol {
    private let urlSession: URLSession
    
    init() {
        urlSession = .shared
    }
    
    func getData(from url: URL) async throws -> Data {
        let (data, response) = try await urlSession.data(from: url)
        guard let response = response as? HTTPURLResponse, response.isOK else {
            throw URLError(.badServerResponse)
        }
        return data
    }
}
