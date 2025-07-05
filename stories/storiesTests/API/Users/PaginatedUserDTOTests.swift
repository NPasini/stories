//
//  PaginatedUserDTOTests.swift
//  stories
//
//  Created by nicolo.pasini on 05/07/25.
//

import Foundation
@testable import stories
import Testing

struct PaginatedUserDTOTests {
    @Test
    func usersListDTOParsing() throws {
        let data = try JsonReader.dataFromFile(named: "users")
        let paginatedUsers: PaginatedUserDTO = try DTOMapper.map(data)
        
        #expect(paginatedUsers.pages.count == 3)
        
        let firstpage = paginatedUsers.pages[0]
        #expect(firstpage.users.count == 10)
        
        let firstUser = firstpage.users[0]
        #expect(firstUser.id == 1)
        #expect(firstUser.name == "Neo")
        #expect(firstUser.profile_picture_url == "https://i.pravatar.cc/300?u=1")
    }
    
    @Test
    func wrongUsersListParsing() throws {
        let data = try JsonReader.dataFromFile(named: "wrong_users")
        
        #expect(throws: APIError.invalidData, performing: {
            let _: PokemonDTO = try DTOMapper.map(data)
        })
    }
}
