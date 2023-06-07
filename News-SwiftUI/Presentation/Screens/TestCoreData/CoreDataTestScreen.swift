//
//  CoreDataTest.swift
//  News-SwiftUI
//
//  Created by Long Le Van on 02/06/2023.
//


import SwiftUI

struct CoreDataTestScreen: View {

    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()

    @ObservedObject private(set) var viewModel = CoreDataTestViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items) { item in
                    NavigationLink {
                        Text("Item at \(item.date!, formatter: itemFormatter)")
                    } label: {
                        Text(item.date!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: viewModel.deleteNews)
            }
            .toolbar {
                ToolbarItem {
                    Button(action: viewModel.addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

}

#if DEBUG
struct CoreDataTestScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CoreDataTestScreen()
        }
    }
}
#endif
