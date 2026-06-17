import SwiftUI

struct UserView: View {

    @StateObject
    private var viewModel:
        UserViewModel

    init(
        viewModel: UserViewModel
    ) {
        _viewModel = StateObject(
            wrappedValue: viewModel
        )
    }

    
    
    var body: some View {

        VStack {

            if viewModel.isLoading {

                ProgressView()

            } else if let user =
                        viewModel.user {

                ProfileView(
                    viewModel: viewModel
                )

            } else if let error =
                        viewModel.errorMessage {

                Text(error)
                    .foregroundStyle(.red)
            }
        }
        .task {

            await viewModel.loadUser()
        }
    }
}

#Preview {

    let repository =
        UserRepositoryImpl(
            api: MockAPI()
        )

    let useCase =
        GetUserUseCaseImpl(
            repository:
                repository
        )

    let viewModel =
        UserViewModel(
            useCase:
                useCase
        )

    UserView(
        viewModel:
            viewModel
    )
}
