import Foundation
protocol APIClientProtocol {

    func request<T: Decodable>(
        endpoint: Endpoint
    ) async throws -> T
}

final class APIClient:
APIClientProtocol {

    func request<T: Decodable>(
        endpoint: Endpoint
    ) async throws -> T {

        do {

            let request =
                endpoint.urlRequest

            let (data, response)
                = try await URLSession
                    .shared
                    .data(for: request)

            guard let response =
                    response
                    as? HTTPURLResponse
            else {
                throw APIError
                    .invalidResponse
            }

            guard 200...299
                    ~= response.statusCode
            else {

                throw APIError
                    .statusCode(
                        response.statusCode
                    )
            }

            do {

                return try JSONDecoder()
                    .decode(
                        T.self,
                        from: data
                    )

            } catch {

                throw APIError
                    .decoding(error)
            }

        } catch {

            throw APIError
                .network(error)
        }
    }
}
