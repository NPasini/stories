//
//  Bundle+Current.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

extension Bundle {
    private class Finder {}
    
    static let current = Bundle(for: Finder.self)
}
