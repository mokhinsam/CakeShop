//
//  StarterViewModel.swift
//  CakeShop
//
//  Created by Дарина Самохина on 13.02.2025.
//

import Foundation

class StarterViewModel {
    var rows: [CakeRowViewModel]
    
    private let cakes: [Cake] = Cake.getCakes()

    init() {
        rows = cakes.map { CakeRowViewModel(cake: $0) }
    }
}
