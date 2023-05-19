//
//  APIError.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 19/05/2023.
//


import Foundation

enum APIError: Error {
    case error(String)
    case networkError

    var localizedDescription: String {
        switch self {
        case .error(let message):
            return message
        case .networkError:
            return "Network error occurred"
        }
    }
}
