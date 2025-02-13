//
//  ImageButton.swift
//  CakeShop
//
//  Created by Дарина Самохина on 13.02.2025.
//

import SwiftUI

struct ImageButton: View {
    var image: String
    var color: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: image)
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
                .foregroundColor(color)
        }
    }
}

#Preview {
    ImageButton(image: "heart.fill", color: .red, action: {})
}
