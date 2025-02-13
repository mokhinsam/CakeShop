//
//  CakeRowViewModel.swift
//  CakeShop
//
//  Created by Дарина Самохина on 13.02.2025.
//

import Foundation

class CakeRowViewModel: ObservableObject {
    private let cake: Cake
    
    var cakeTitle: String {
        "Торт \(cake.title)"
    }
    
    var cakeCostTitle: String {
        "\(cake.cost) ₽"
    }
    
    var cakeCost: Int {
        cake.cost
    }
    
    var cakeWeight: String {
        "\(cake.weight) г"
    }
    
    var cakeImage: String {
        cake.image
    }
    
    @Published var isFavorite: Bool {
        didSet {
            StorageManager.shared.save(favoriteStatus: isFavorite, for: cake.title)
        }
    }
    
    @Published var cakeCount: Int {
        didSet {
            StorageManager.shared.update(cakeCount: cakeCount, for: cake.title)
        }
    }
    
    init(cake: Cake) {
        self.cake = cake
        isFavorite = StorageManager.shared.loadFavoriteStatus(for: cake.title)
        cakeCount = StorageManager.shared.loadCakeCount(for: cake.title)
    }
    
    func favoriteButtonPressed() {
        isFavorite.toggle()
    }
    
    func costButtonPressed() {
        cakeCount += 1
    }
}
