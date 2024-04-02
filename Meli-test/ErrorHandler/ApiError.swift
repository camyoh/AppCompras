//
//  ApiError.swift
//  Meli-test
//
//  Created by Andres Mendieta on 1/04/24.
//

import UIKit

enum ApiError: Error {
    case noInternet
    case invalidURL
    case requestFailed
    case invalidResponse
    case decodingError
}

struct ErrorAlertFactory {
    static func make(for error: ApiError?) -> UIAlertController {
        var message = ""
        switch error {
            case .noInternet:
                message = "No tienes conexión a internet, intenta más tarde"
            case .invalidURL:
                message = "Tenemos problemas de nuestro lado, intenta más tarde"
            case .requestFailed:
                message = "Tenemos problemas de nuestro lado, intenta más tarde"
            case .invalidResponse:
                message = "Tenemos problemas de nuestro lado, intenta más tarde"
            case .decodingError:
                message = "Tenemos problemas de nuestro lado, intenta más tarde"
            case .none:
                message = "Tenemos problemas de nuestro lado, intenta más tarde"
        }

        let alert = UIAlertController(title: "Ups...", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        return alert
    }
}
