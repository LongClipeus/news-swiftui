//
//  ReadingScreen.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 17/05/2023.
//


import SwiftUI

struct ReadingScreen: View {
    /// An action to let the user open this article in their preferred web browser.
    @Environment(\.openURL) var openURL
    
    /// The article they want to read.
    let news: News
    
    var body: some View {
        ScrollView {
            buildImageView(news.image)
            buildContent(news)
        }
        .navigationTitle(news.section)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                // Open this article in their preferred web browser.
                openURL(news.url)
            } label: {
                Label("Open in your web browser", systemImage: "safari")
            }
        }
    }
    
    private func buildImageView(_ imageURL: URL) -> some View {
        AsyncImage(url: imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            default:
                Image(systemName: "newspaper")
            }
        }
    }
    
    private func buildContent(_ news: News) -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(news.title)
                .font(.title)
            
            Text(news.description)
                .font(.headline)
                .foregroundColor(.secondary)
            
            Divider()
            
            VStack(alignment: .leading) {
                Text(news.author)
                    .font(.headline.weight(.heavy))
                
                Text(news.date.formatted(date: .abbreviated, time: .standard))
                    .font(.headline)
            }
            
            Text(news.text)
        }
        .padding(.horizontal)
    }
}

struct ReadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ReadingScreen(news: DataUtils.newsExample)
        }
    }
}
