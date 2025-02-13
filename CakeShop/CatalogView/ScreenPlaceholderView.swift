//
//  ScreenPlaceholderView.swift
//  CakeShop
//
//  Created by Дарина Самохина on 13.02.2025.
//

import SwiftUI

struct ScreenPlaceholderView: View {
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .foregroundStyle(.secondary)
            LayerCakeView()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    ScreenPlaceholderView(title: "Корзина пуста")
}
