//
//  NewsDataRepository.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 19/05/2023.
//

import Foundation

struct NewsDataRepository : NewsRepository {

    private let urlSample = URL(string: "https://gist.githubusercontent.com/LongClipeus/e3644fb2d168283f0521d4b2c01b3811/raw/8e605394190d2b60a0acbec1c5f77f0667129c98/news.json")

    func getArticles() async throws -> [News] {
        guard let url: URL = urlSample else {
            return []
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        let articles = try decoder.decode([Article].self, from: data).sorted()

        // Map article to news entity
        let newsList: [News] = articles.map { article in
            News(
                id: article.id,
                section: article.section,
                title: article.title,
                description: article.description,
                author: article.author,
                text: article.text,
                thumbnail: article.thumbnail,
                image: article.image,
                date: article.date,
                url: article.url
            )
        }
        return newsList
    }

}
