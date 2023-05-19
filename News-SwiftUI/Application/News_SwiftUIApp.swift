//
//  News_SwiftUIApp.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 16/05/2023.
//

import SwiftUI

@main
struct News_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeScreen(newsList: [DataUtils.newsExample])
            }
        }
    }
}
