import Foundation

enum Endpoint {

    case user(Int)

    var path: String {

        switch self {

        case .user(let id):
            return "/users/\(id)"
        }
    }

    var method: String {

        switch self {

        case .user:
            return "GET"
        }
    }
}


extension Endpoint {

    var urlRequest: URLRequest {

        let baseURL =
            "https://jsonplaceholder.typicode.com"

        guard let url = URL(
            string: baseURL + path
        ) else {
            fatalError()
        }

        var request =
            URLRequest(url: url)

        request.httpMethod = method

        return request
    }
}
