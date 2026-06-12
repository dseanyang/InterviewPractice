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


