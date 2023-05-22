//
//  HomeViewModel.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 18/05/2023.
//

import SwiftUI

class HomeViewModel: ObservableObject {

    @Published var newsList = [News]()

    //private let fetchUsersUseCase: FetchNewsUseCase =
    private let newsRepository = NewsDataRepository()

    func fetchNews() {
        print("fetch news: start")
        Task {
            do {
                let result = try await newsRepository.getArticles()
                print("fetch news: result = \(result)")
                updateToUI(data: result)
            }
            catch {
                print("fetch news: \(error.self)")
            }
        }
    }

    private func updateToUI(data: [News]) {
        DispatchQueue.main.async {
            self.newsList = data
        }
    }
}
