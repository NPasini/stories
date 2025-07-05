//
//  UserDataSource.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

protocol UserDataSourceProtocol {
    func getUsers(atPage page: Int) throws -> [UserDTO]
}

struct UserDataSource {
    private static let dataFileName: String = "users"

    let dataReader: JsonReaderProtocol
}

extension UserDataSource: UserDataSourceProtocol {
    func getUsers(atPage page: Int) throws -> [UserDTO] {
        let paginatedUsers: PaginatedUserDTO = try DTOMapper.map(dataReader.dataFromFile(named: Self.dataFileName))
        
        let normalizedPage = page % paginatedUsers.pages.count
        return paginatedUsers.pages[normalizedPage].users
    }
}
