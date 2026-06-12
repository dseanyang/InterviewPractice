enum APIError: Error {

    case invalidURL

    case invalidResponse

    case statusCode(Int)

    case decoding(Error)

    case network(Error)

    case unknown
}
