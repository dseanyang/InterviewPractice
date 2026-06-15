import SwiftUI

struct UserView: View {

    @StateObject
    private var viewModel:
        UserViewModel

    init(
        viewModel: UserViewModel
    ) {

        _viewModel =
            StateObject(
                wrappedValue:
                    viewModel
            )
    }

    var body: some View {

        VStack {

            if let user =
                viewModel.user {

                Text(user.name)

            } else {

                ProgressView()
            }
        }
        .task {

            await viewModel.loadUser()
        }
    }
}

#Preview("Success") {

    let repository = UserRepositoryImpl(
        api: MockAPI()
    )

    let viewModel = UserViewModel(
        repository: repository
    )

    UserView(
        viewModel: viewModel
    )
}

#Preview("Error") {

    let repository = UserRepositoryImpl(
        api: MockFailAPI()
    )

    let viewModel = UserViewModel(
        repository: repository
    )

    UserView(
        viewModel: viewModel
    )
}
