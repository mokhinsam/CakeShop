//
//  StarterViewModel.swift
//  CakeShop
//
//  Created by Дарина Самохина on 13.02.2025.
//

import Foundation
import Combine

class StarterViewModel: ObservableObject {
    @Published var rows: [CakeRowViewModel]
    
    private let cakes: [Cake] = Cake.getCakes()
    private var cancellables: Set<AnyCancellable> = []
    
    var rowsInCart: [CakeRowViewModel] {
        rows.filter { $0.cakeCount > 0 }
    }
    
    var rowsInCartCount: Int {
        rowsInCart.count
    }
    
    var rowsInFavorites: [CakeRowViewModel] {
        rows.filter { $0.isFavorite }
    }

    init() {
        rows = cakes.map { CakeRowViewModel(cake: $0) }
        observeCakesCount()
        observeFavoriteStatuses()
    }
    
    private func observeCakesCount() {
        rows.forEach { cakeViewModel in
            cakeViewModel.$cakeCount
                .sink { [weak self] _ in
                    self?.objectWillChange.send()
                }
                .store(in: &cancellables)
        }
    }
    
    private func observeFavoriteStatuses() {
        rows.forEach { cakeViewModel in
            cakeViewModel.$isFavorite
                .sink { [weak self] _ in
                    self?.objectWillChange.send()
                }
                .store(in: &cancellables)
        }
    }
}
