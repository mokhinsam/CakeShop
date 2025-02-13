//
//  StorageManager.swift
//  CakeShop
//
//  Created by Дарина Самохина on 13.02.2025.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    func save(favoriteStatus: Bool, for cake: String) {
        defaults.set(favoriteStatus, forKey: cake)
    }
    
    func loadFavoriteStatus(for cake: String) -> Bool {
        defaults.bool(forKey: cake)
    }
    
    func update(cakeCount count: Int, for cake: String) {
        defaults.set(count, forKey: cake)
    }
    
    func loadCakeCount(for cake: String) -> Int {
        defaults.integer(forKey: cake)
    }
}
