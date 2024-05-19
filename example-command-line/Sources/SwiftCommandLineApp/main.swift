import Foundation
import SwiftCommandLineAppCore

// Exemplo de uso
fetchUsers { result in
    switch result {
    case .success(let users):
        for user in users {
            print("ID: \(user.id), Name: \(user.name), Email: \(user.email), Gender: \(user.gender), Status: \(user.status)")
        }
    case .failure(let error):
        print("Erro: \(error)")
    }
    
    // Encerrar o programa após a resposta
    exit(0)
}

// Manter o loop principal ativo para que a solicitação seja concluída
RunLoop.main.run()
