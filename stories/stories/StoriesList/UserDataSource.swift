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
    
    enum Error: Swift.Error {
        case noMoreUsers
    }
    
    let dataReader: JsonReaderProtocol
}

extension UserDataSource: UserDataSourceProtocol {
    func getUsers(atPage page: Int) throws -> [UserDTO] {
        let paginatedUsers: PaginatedUserDTO = try DTOMapper.map(dataReader.dataFromFile(named: Self.dataFileName))
        
        guard page >= paginatedUsers.pages.count else { throw Error.noMoreUsers }
        return paginatedUsers.pages[page].users
    }
}
