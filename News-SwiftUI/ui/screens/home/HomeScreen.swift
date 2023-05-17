//
//  HomeScreen.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 17/05/2023.
//


import SwiftUI

struct HomeScreen: View {

    @State private var articles = [Article]()

    var body: some View {
        List(articles, rowContent: ArticleRow.init)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
