//
//  JsonReader.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

protocol JsonReaderProtocol {
    func dataFromFile(named fileName: String) throws -> Data
}

struct JsonReader: JsonReaderProtocol {
    func dataFromFile(named fileName: String) throws -> Data {
        let url = Bundle.main.url(forResource: fileName, withExtension: "json")!
        return try Data(contentsOf: url)
    }
}
