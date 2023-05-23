//
//  ArticleRow.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 17/05/2023.
//

import SwiftUI

struct ArticleRow: View {

    /// The article this row should be showing.
    let news: News

    var body: some View {
        NavigationLink {
            ReadingScreen(news: news)
        } label: {
            HStack {
                buildImagePreview(news: news)
                buildContent(news: news)
            }
        }
    }

    private func buildImagePreview(news: News) -> some View {
        AsyncImage(url: news.thumbnail) { phase in
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
        .frame(width: 80, height: 80)
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }

    private func buildContent(news: News) -> some View {
        VStack(alignment: .leading) {
            Text(news.section)
                .font(.caption.weight(.heavy))
            Text(news.title)
        }
    }
}

#if DEBUG
struct ArticleRow_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRow(news: DataUtils.newsExample)
    }
}
#endif
