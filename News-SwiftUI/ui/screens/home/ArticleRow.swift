//
//  ArticleRow.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 17/05/2023.
//


import SwiftUI

struct ArticleRow: View {

    /// The article this row should be showing.
    let article: Article

    var body: some View {
        NavigationLink {
            ReadingScreen()
        } label: {
            HStack {
                buildImagePreview(article: article)
                buildContent(article: article)
            }
        }
    }

    private func buildImagePreview(article: Article) -> some View {
        AsyncImage(url: article.thumbnail) { phase in
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

    private func buildContent(article: Article) -> some View {
        VStack(alignment: .leading) {
            Text(article.section)
                .font(.caption.weight(.heavy))
            Text(article.title)
        }
    }
}

#if DEBUG
struct ArticleRow_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRow(article: DataUtils.articleExample)
    }
}
#endif
