//
//  Untitled.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

class FavouritesUserDefaultsStorage: UserDefaultsStorage {
    init(userDefaultsSuite: UserDefaults) {
        super.init(key: "fav_story_", userDefaultsSuite: userDefaultsSuite)
    }
}
