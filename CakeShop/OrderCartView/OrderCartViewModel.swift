//
//  OrderCartViewModel.swift
//  CakeShop
//
//  Created by Дарина Самохина on 13.02.2025.
//

import Foundation

class OrderCartViewModel: ObservableObject {
    var rows: [CakeRowViewModel]
    
    @Published var alertIsPresented = false
    @Published var orderSheetIsPresented = false
    @Published var trashButtonIsAnimated = false

    var totalAmount: String {
        "\(cakesCostCalculation + deliveryCostCalculation) ₽"
    }
    
    var deliveryAmount: String {
        "\(deliveryCostCalculation) ₽"
    }
    
    private var deliveryCostCalculation: Int {
        cakesCostCalculation >= 5000 || cakesCostCalculation == 0 ? 0 : 1000
    }
    
    private var cakesCostCalculation: Int {
        rows.reduce(0) { $0 + $1.cakeCost * $1.cakeCount }
    }
    
    init(rows: [CakeRowViewModel]) {
        self.rows = rows
    }
    
    func showAlert() {
        alertIsPresented.toggle()
    }
    
    func isShowingOrderSheet() {
        orderSheetIsPresented.toggle()
    }

    func cleanCartWithAnimation() {
        if !rows.isEmpty {
            togglingTrashButtonAnimationStatus()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
                self?.cleanCart()
                self?.togglingTrashButtonAnimationStatus()
            }
        }
    }
    
    private func cleanCart() {
        rows.forEach { $0.cakeCount = 0 }
        rows.removeAll()
    }
    
    private func togglingTrashButtonAnimationStatus() {
        trashButtonIsAnimated.toggle()
    }
}
