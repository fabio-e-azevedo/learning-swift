// FetchUsers.swift

import Alamofire

public struct User: Codable {
    public let id: Int
    public let name: String
    public let email: String
    public let gender: String
    public let status: String
}

public func fetchUsers(completion: @escaping (Result<[User], AFError>) -> Void) {
    let urlString = "https://gorest.co.in/public/v2/users"
    AF.request(urlString).responseDecodable(of: [User].self) { response in
        completion(response.result)
    }
}
