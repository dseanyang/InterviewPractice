//
//  ProfileView.swift
//  InterviewPractice
//
//  Created by potentia on 2026/6/17.
//
import SwiftUI
struct ProfileView: View {

    @ObservedObject
    var viewModel:
        UserViewModel

    var body: some View {

        VStack {

            Text(
                viewModel.user?.name
                ?? ""
            )

            Text(
                viewModel.user?.email
                ?? ""
            )
        }
    }
}
