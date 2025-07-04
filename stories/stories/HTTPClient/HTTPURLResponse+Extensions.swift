//
//  HTTPURLResponse+Extensions.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

extension HTTPURLResponse {
    var isOK: Bool {
        (200...299).contains(statusCode)
    }
}
