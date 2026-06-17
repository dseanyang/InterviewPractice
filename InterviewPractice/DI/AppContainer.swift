//
//  Untitled.swift
//  InterviewPractice
//
//  Created by potentia on 2026/6/17.
//

final class AppContainer {

    lazy var api =
        APIClient()

    lazy var repository =
        UserRepositoryImpl(
            api: api
        )

    lazy var getUserUseCase =
        GetUserUseCaseImpl(
            repository:
                repository
        )

    @MainActor func makeUserViewModel()
        -> UserViewModel {

        UserViewModel(
            useCase:
                getUserUseCase
        )
    }
}
