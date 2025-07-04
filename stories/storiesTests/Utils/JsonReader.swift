//
//  JsonReader.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

enum JsonReader {
    static func dataFromFile(named fileName: String) throws -> Data {
        let url = Bundle.current.url(forResource: fileName, withExtension: "json")!
        return try Data(contentsOf: url)
    }
}
