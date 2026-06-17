//
//      GetUserUseCaseImpl.swift
//  InterviewPractice
//
//  Created by potentia on 2026/6/17.
//

final class GetUserUseCaseImpl:
GetUserUseCase {

    private let repository:
        UserRepository

    init(
        repository: UserRepository
    ) {
        self.repository = repository
    }

    func execute(
        id: Int
    ) async throws -> User {

        try await repository
            .getUser(id: id)
    }
}
