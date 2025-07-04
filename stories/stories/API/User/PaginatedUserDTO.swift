//
//  PaginatedUserDTO.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

struct PaginatedUserDTO: Decodable {
    let pages: [UserPageDTO]
}

struct UserPageDTO: Decodable {
    let users: [UserDTO]
}
