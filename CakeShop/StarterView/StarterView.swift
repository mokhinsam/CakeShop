//
//  StarterView.swift
//  CakeShop
//
//  Created by Дарина Самохина on 13.02.2025.
//

import SwiftUI

struct StarterView: View {
    @StateObject private var viewModel = StarterViewModel()
    
    var body: some View {
        TabView {
            CatalogView(viewModel: CatalogViewModel(rows: viewModel.rows))
                .tabItem {
                    Label("Каталог", systemImage: "circle.hexagongrid.fill")
                }
            OrderCartView(viewModel: OrderCartViewModel(rows: viewModel.rowsInCart))
                .tabItem {
                    Label("Корзина", systemImage: "cart")
                }
                .badge(viewModel.rowsInCartCount)
            FavoritesView(viewModel: FavoritesViewModel(rows: viewModel.rowsInFavorites))
                .tabItem {
                    Label("Избранное", systemImage: "heart")
                }
        }
        .tint(.green)
    }
}

#Preview {
    StarterView()
}
