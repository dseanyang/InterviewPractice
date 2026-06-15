import Foundation
final class MockFailAPI:
APIClientProtocol {

    func request<T: Decodable>(
        endpoint: Endpoint
    ) async throws -> T {

        throw APIError.network(
            URLError(.notConnectedToInternet)
        )
    }
}

final class MockAPI:
APIClientProtocol {

    func request<T>(
        endpoint: Endpoint
    ) async throws -> T
    where T : Decodable {

        let user = User(
            id: 1,
            name: "Mock User",
            username: "mock",
            email: "mock@test.com"
        )

        return user as! T
    }
}
