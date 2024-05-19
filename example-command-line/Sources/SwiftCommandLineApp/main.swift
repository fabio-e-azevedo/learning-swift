import Foundation
import SwiftCommandLineAppCore

fetchUsers { result in
    switch result {
    case .success(let users):
        for user in users {
            print("ID: \(user.id), Name: \(user.name), Email: \(user.email), Gender: \(user.gender), Status: \(user.status)")
        }
    case .failure(let error):
        print("Erro: \(error)")
    }
    
    exit(0)
}

RunLoop.main.run()
