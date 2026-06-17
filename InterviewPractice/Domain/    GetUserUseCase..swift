//
//      GetUserUseCase..swift
//  InterviewPractice
//
//  Created by potentia on 2026/6/17.
//

protocol GetUserUseCase {

    func execute(
        id: Int
    ) async throws -> User
}
