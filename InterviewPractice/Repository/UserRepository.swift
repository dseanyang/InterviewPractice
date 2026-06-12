protocol UserRepository {

    func getUser(
        id: Int
    ) async throws -> User
}

final class UserRepositoryImpl:
UserRepository {

    private let api:
        APIClientProtocol

    init(
        api: APIClientProtocol
    ) {
        self.api = api
    }

    func getUser(
        id: Int
    ) async throws -> User {

        let user: User =
            try await api.request(
                endpoint: .user(id)
            )

        return user
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
