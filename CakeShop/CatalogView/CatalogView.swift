//
//  CatalogView.swift
//  CakeShop
//
//  Created by Дарина Самохина on 13.02.2025.
//

import SwiftUI

struct CatalogView: View {
    var viewModel: CatalogViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.yellow
                    .opacity(0.2)
                    .ignoresSafeArea()
                VStack {
                    if viewModel.rows.count > 0 {
                        ScrollView {
                            LazyVStack {
                                ForEach(viewModel.rows, id: \.cakeTitle) { cakeViewModel in
                                    CakeRow(viewModel: cakeViewModel)
                                }
                            }
                        }
                    } else {
                        ScreenPlaceholderView(title: "Каталог пуст")
                    }
                }
                .navigationTitle("Каталог")
                .padding()
            }
        }
    }
}

#Preview {
    CatalogView(viewModel: CatalogViewModel(rows: []))
}
