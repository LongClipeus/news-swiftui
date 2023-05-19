//
//  News.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 19/05/2023.
//

import Foundation

/// One article in our downloaded data.
struct News: Decodable, Identifiable {
    /// The unique identifier string.
    let id: String

    /// The part of the Guardian API this belongs to, e.g. World News or Sport.
    var section: String

    /// The main title for the article.
    var title: String

    /// A subheadline or teaser giving more information about the article.
    var description: String

    /// One or more authors responsible for this article.
    var author: String

    /// The main body text.
    var text: String

    /// A 500x500 image suitable for showing at smaller sizes.
    var thumbnail: URL

    /// A 1000x1000 image suitable for showing in `ReadingView`
    var image: URL

    /// The publication date for this article.
    var date: Date

    /// The URL for the full article on the web.
    var url: URL

}
