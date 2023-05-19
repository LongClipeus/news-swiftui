//
//  NewsRepository.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 18/05/2023.
//


import Foundation

protocol NewsRepository {
    func getArticles() async throws -> [News]
}
