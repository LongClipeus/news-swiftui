//
//  DataUtils.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 17/05/2023.
//


import Foundation

struct DataUtils {

    /// An example property that's used for Xcode previewing.
    static let articleExample = Article(
        id: "1",
        section: "News",
        title: "Apple buys Hacking with Swift",
        description: "What a way to spend $10 million!",
        author: "Not Paul Hudson",
        text: "In a move that shocked everyone, especially Tim Cook and Paul Hudson, Apple bought hackingwithswift.com",
        thumbnail: URL(string: "https://hws.dev/img/logo.png")!,
        image: URL(string: "https://hws.dev/img/logo.png")!,
        date: .now,
        url: URL(string: "https://www.hackingwithswift.com")!
    )

}
