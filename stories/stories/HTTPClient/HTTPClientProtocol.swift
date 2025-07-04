//
//  HTTPClientProtocol.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

protocol HTTPClientProtocol {
    func getData(from url: URL) async throws -> Data
}
