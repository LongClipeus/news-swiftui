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
    let article: Article
    
    var body: some View {
        ScrollView {
            buildImageView(article.image)
            buildContent(article)
        }
        .navigationTitle(article.section)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                // Open this article in their preferred web browser.
                openURL(article.url)
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
    
    private func buildContent(_ article: Article) -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(article.title)
                .font(.title)
            
            Text(article.description)
                .font(.headline)
                .foregroundColor(.secondary)
            
            Divider()
            
            VStack(alignment: .leading) {
                Text(article.author)
                    .font(.headline.weight(.heavy))
                
                Text(article.date.formatted(date: .abbreviated, time: .standard))
                    .font(.headline)
            }
            
            Text(article.text)
        }
        .padding(.horizontal)
    }
}

struct ReadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ReadingScreen(article: DataUtils.articleExample)
        }
    }
}
