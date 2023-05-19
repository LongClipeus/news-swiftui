//
//  NetworkUtils.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 19/05/2023.
//


import Foundation

struct NetworkUtils {

    func fetchAPI<T: Decodable>(url: URL) async throws -> T {
        let data = try await URLSession.shared.data(url: url)
        let decodeData = try JSONDecoder().decode(T.self, from: data)
        return decodeData
    }
}
