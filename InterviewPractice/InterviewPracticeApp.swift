//
//  InterviewPracticeApp.swift
//  InterviewPractice
//
//  Created by potentia on 2026/6/12.
//

import SwiftUI


@main
struct InterviewPracticeApp: App {

    var body: some Scene {

        WindowGroup {

            let api =
                APIClient()

            let repository =
                UserRepositoryImpl(
                    api: api
                )

            let viewModel =
                UserViewModel(
                    repository:
                        repository
                )

            UserView(
                viewModel:
                    viewModel
            )
        }
    }
}

