//
//  StarterView.swift
//  CakeShop
//
//  Created by Дарина Самохина on 13.02.2025.
//

import SwiftUI

struct StarterView: View {
    private var viewModel = StarterViewModel()
    
    var body: some View {
        TabView {
            CatalogView(viewModel: CatalogViewModel(rows: viewModel.rows))
                .tabItem {
                    Label("Каталог", systemImage: "circle.hexagongrid.fill")
                }
        }
        .tint(.green)
    }
}

#Preview {
    StarterView()
}
