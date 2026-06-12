import Combine

@MainActor
final class UserViewModel: ObservableObject {

    @Published
    var user: User?

    @Published
    var isLoading = false

    @Published
    var errorMessage: String?

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func loadUser() async {
        do {
            user = try await repository.getUser(id: 1)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

