import XCTest
@testable import SwiftCommandLineAppCore


final class SwiftCommandLineAppTests: XCTestCase {

    // Teste de decodificação de JSON
    func testUserDecoding() throws {
        let json = """
        [
            {
                "id": 1,
                "name": "John Doe",
                "email": "john.doe@example.com",
                "gender": "male",
                "status": "active"
            },
            {
                "id": 2,
                "name": "Jane Doe",
                "email": "jane.doe@example.com",
                "gender": "female",
                "status": "inactive"
            }
        ]
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let users = try decoder.decode([User].self, from: json)
        
        XCTAssertEqual(users.count, 2)
        XCTAssertEqual(users[0].id, 1)
        XCTAssertEqual(users[0].name, "John Doe")
        XCTAssertEqual(users[0].email, "john.doe@example.com")
        XCTAssertEqual(users[0].gender, "male")
        XCTAssertEqual(users[0].status, "active")
        
        XCTAssertEqual(users[1].id, 2)
        XCTAssertEqual(users[1].name, "Jane Doe")
        XCTAssertEqual(users[1].email, "jane.doe@example.com")
        XCTAssertEqual(users[1].gender, "female")
        XCTAssertEqual(users[1].status, "inactive")
    }

    // Teste da função fetchUsers com uma resposta de mock
    func testFetchUsers() throws {
        let expectation = self.expectation(description: "Fetching users")
        
        fetchUsers { result in
            switch result {
            case .success(let users):
                XCTAssertGreaterThan(users.count, 0)
            case .failure(let error):
                XCTFail("Erro: \(error)")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
