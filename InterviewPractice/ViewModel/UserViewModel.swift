import Combine

@MainActor
final class UserViewModel:
ObservableObject {

    @Published
    var user: User?

    @Published
    var isLoading = false

    @Published
    var errorMessage: String?

    private let useCase:
        GetUserUseCase

    init(
        useCase: GetUserUseCase
    ) {
        self.useCase = useCase
    }

    func loadUser() async {

        isLoading = true

        defer {
            isLoading = false
        }

        do {

            user =
                try await useCase
                    .execute(id: 1)

        } catch {

            errorMessage =
                error.localizedDescription
        }
    }
}
