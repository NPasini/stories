//
//  UserDTO.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

struct UserDTO: Decodable {
    let id: Int
    let name: String
    let profile_picture_url: String
}
