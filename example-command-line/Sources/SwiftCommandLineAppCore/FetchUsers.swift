// FetchUsers.swift

import Foundation
import Alamofire

// Modelo para representar um usuário
public struct User: Codable {
    public let id: Int
    public let name: String
    public let email: String
    public let gender: String
    public let status: String
}

// Função que faz a requisição e processa a resposta
public func fetchUsers(completion: @escaping (Result<[User], AFError>) -> Void) {
    let urlString = "https://gorest.co.in/public/v2/users"
    AF.request(urlString).responseDecodable(of: [User].self) { response in
        completion(response.result)
    }
}
