//
//  FetchNewsInteractor.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 19/05/2023.
//

import Foundation

class FetchNewsInteractor : FetchNewsUseCase {

    private let newsRepository: NewsRepository

    init(newsRepository: NewsRepository) {
        self.newsRepository = newsRepository
    }

    func fetchNews() async -> [News] {
        do {
            return try await newsRepository.getArticles()
        } catch {
            print("Fetch news failed: \(error)")
            return [News]()
        }
    }
}
