//
//  OrderCartViewModelTests.swift
//  OrderCartViewModelTests
//
//  Created by Дарина Самохина on 19.02.2025.
//

import XCTest
@testable import CakeShop

final class OrderCartViewModelTests: XCTestCase {

    var sut: OrderCartViewModel!

    override func setUp() {
        super.setUp()
        let rows: [CakeRowViewModel] = [
            CakeRowViewModel(
                cake:
                    Cake(
                        title: "Cake 1",
                        weight: 500,
                        cost: 1000,
                        image: "cake1"
                    )
            ),
            CakeRowViewModel(
                cake:
                    Cake(
                        title: "Cake 2",
                        weight: 700,
                        cost: 1500,
                        image: "cake2"
                    )
            )
        ]
        sut = OrderCartViewModel(rows: rows)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testAlertIsPresentedShouldBeFalseWhenInitialized() {
        let alertIsPresented = sut.alertIsPresented
        XCTAssertFalse(alertIsPresented, "Alert should not be presented initially.")
    }
    
    func testOrderSheetIsPresentedShouldBeFalseWhenInitialized() {
        let orderSheetIsPresented = sut.orderSheetIsPresented
        XCTAssertFalse(orderSheetIsPresented, "Order sheet should not be presented initially.")
    }
    
    func testTrashButtonIsAnimatedShouldBeFalseWhenInitialized() {
        let trashButtonIsAnimated = sut.trashButtonIsAnimated
        XCTAssertFalse(trashButtonIsAnimated, "Trash button should not be animated initially.")
    }

    func testTotalAmountShouldCalculateCostOfAllCakesInOrderWhenDeliveryIsZero() {
        setCount(forCakeOne: 3, AndCakeTwo: 2) // 3 of Cake 1 -> 3000, 2 of Cake 2 -> 3000
        let totalAmount = sut.totalAmount
        XCTAssertEqual(totalAmount, "6000 ₽", "Total amount calculation is incorrect.")
    }
    
    func testTotalAmountShouldCalculateCostOfAllCakesInOrderWhenDeliveryIsThousand() {
        setCount(forCakeOne: 1, AndCakeTwo: 1) // 1 of Cake 1 -> 1000, 1 of Cake 2 -> 1500
        let totalAmount = sut.totalAmount
        XCTAssertEqual(totalAmount, "3500 ₽", "Total amount calculation is incorrect.")
    }
    
    func testDeliveryAmountShouldBeZeroWhenCostOfCakesMoreThanFiveThousand() {
        setCount(forCakeOne: 6, AndCakeTwo: 0) // 6 of Cake 1 -> 6000, 0 of Cake 2 -> 0
        let deliveryAmount = sut.deliveryAmount
        XCTAssertEqual(deliveryAmount, "0 ₽", "Delivery charge should be zero for orders over 5000.")
    }
    
    func testDeliveryAmountShouldBeThousandWhenCostOfCakesLessThanFiveThousand() {
        setCount(forCakeOne: 1, AndCakeTwo: 0) // 1 of Cake 1 -> 1000, 0 of Cake 2 -> 0
        let deliveryAmount = sut.deliveryAmount
        XCTAssertEqual(deliveryAmount, "1000 ₽", "Delivery charge should be 1000 for orders of less than 5000.")
    }
    
    func testShowAlertShouldTogglingAlertIsPresentedWhenCalled() {
        sut.showAlert()
        var alertIsPresented = sut.alertIsPresented //true
        XCTAssertTrue(alertIsPresented, "Alert should be presented after toggling.")
        sut.showAlert()
        alertIsPresented = sut.alertIsPresented //false
        XCTAssertFalse(alertIsPresented, "Alert should not be presented after toggling again.")
        sut.showAlert()
        alertIsPresented = sut.alertIsPresented //true
        XCTAssertTrue(alertIsPresented, "Alert should be presented after toggling.")
    }
    
    func testIsShowingOrderSheetShouldTogglingOrderSheetIsPresentedWhenCalled() {
        sut.isShowingOrderSheet()
        var orderSheetIsPresented = sut.orderSheetIsPresented //true
        XCTAssertTrue(orderSheetIsPresented, "Order sheet should be presented after toggling.")
        sut.isShowingOrderSheet()
        orderSheetIsPresented = sut.orderSheetIsPresented //false
        XCTAssertFalse(orderSheetIsPresented, "Order sheet should not be presented after toggling again.")
        sut.isShowingOrderSheet()
        orderSheetIsPresented = sut.orderSheetIsPresented //true
        XCTAssertTrue(orderSheetIsPresented, "Order sheet should be presented after toggling.")
    }
    
    func testCleanCartWithAnimationShouldCleanCartWhenCartIsNotEmpty() {
        sut.cleanCartWithAnimation()
        let expectation = expectation(description: "Wait for cleanCart to be called")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            let rowsInCart = self.sut.rows.count
            XCTAssertEqual(rowsInCart, 0, "The rows count should be 0 after cleaning")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1) { error in
            guard let error = error else { return }
            XCTFail("Expectation failed with error: \(error.localizedDescription)")
        }
    }
    
    func testCleanCartWithAnimationShouldNotCleanCartWhenCartIsEmpty() {
        sut.rows = []
        sut.cleanCartWithAnimation()
        let trashButtonIsAnimated = sut.trashButtonIsAnimated
        XCTAssertFalse(trashButtonIsAnimated, "The trash button should not be animated (true), when cart is empty.")
    }
}

//MARK: - Private Methods
extension OrderCartViewModelTests {
    private func setCount(forCakeOne cakeOne: Int, AndCakeTwo cakeTwo: Int) {
        sut.rows[0].cakeCount = cakeOne
        sut.rows[1].cakeCount = cakeTwo
    }
}
