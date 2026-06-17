//
//  InterviewPracticeApp.swift
//  InterviewPractice
//
//  Created by potentia on 2026/6/12.
//

import SwiftUI

@main
struct InterviewPracticeApp:
App {

    let container =
        AppContainer()

    @StateObject
    var session =
        SessionStore()

    var body: some Scene {

        WindowGroup {

            UserView(
                viewModel:
                    container
                        .makeUserViewModel()
            )
            .environmentObject(
                session
            )
        }
    }
}
