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
