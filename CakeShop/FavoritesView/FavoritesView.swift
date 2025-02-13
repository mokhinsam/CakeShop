//
//  FavoritesView.swift
//  CakeShop
//
//  Created by Дарина Самохина on 13.02.2025.
//

import SwiftUI

struct FavoritesView: View {
    var viewModel: FavoritesViewModel
    
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
                        ScreenPlaceholderView(title: "Избранное пусто")
                    }
                }
                .navigationTitle("Избранное")
                .padding()
            }
        }
    }
}

#Preview {
    FavoritesView(viewModel: FavoritesViewModel(rows: []))
}
