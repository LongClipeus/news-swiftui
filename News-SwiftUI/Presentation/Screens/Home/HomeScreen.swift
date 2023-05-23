//
//  HomeScreen.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 17/05/2023.
//


import SwiftUI

struct HomeScreen: View {
    
    let newsList: [News]
    
    @ObservedObject private(set) var viewModel = HomeViewModel()
    
    var body: some View {
        List(viewModel.newsList, rowContent: ArticleRow.init)
            .onAppear(perform: {
                viewModel.fetchNews()
            })
    }
}

#if DEBUG
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeScreen(newsList: [DataUtils.newsExample])
        }
    }
}
#endif
