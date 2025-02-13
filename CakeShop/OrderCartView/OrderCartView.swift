//
//  OrderCartView.swift
//  CakeShop
//
//  Created by Дарина Самохина on 13.02.2025.
//

import SwiftUI

struct OrderCartView: View {
    @ObservedObject var viewModel: OrderCartViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.yellow
                    .opacity(0.2)
                    .ignoresSafeArea()
                VStack {
                    if viewModel.rows.count > 0 {
                        ScrollView {
                            LazyVStack {
                                ForEach(viewModel.rows, id: \.cakeTitle) { cakeViewModel in
                                    CakeRow(viewModel: cakeViewModel)
                                }
                            }
                        }
                        DeliveryView(
                            alertIsPresented: $viewModel.alertIsPresented,
                            deliveryAmount: viewModel.deliveryAmount)
                        {
                            viewModel.showAlert()
                        }
                        .padding(10)
                        OrderButton(totalAmount: viewModel.totalAmount) {
                            viewModel.isShowingOrderSheet()
                        }
                        .sheet(
                            isPresented: $viewModel.orderSheetIsPresented,
                            onDismiss: { viewModel.cleanCartWithAnimation() },
                            content: {
                                Text("Ваш заказ оформлен")
                                    .font(.title)
                                    .bold()
                                Button("Закрыть") {
                                    viewModel.isShowingOrderSheet()
                                }
                            }
                        )
                    } else {
                        ScreenPlaceholderView(title: "Корзина пуста")
                    }
                }
                .padding()
                .navigationTitle("Корзина")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        TrashButton(animated: viewModel.trashButtonIsAnimated) {
                            viewModel.cleanCartWithAnimation()
                        }
                    }
                }
            }
        }
    }
}

//MARK: - TrashButton
struct TrashButton: View {
    var animated: Bool
    var action: () -> Void
    
    var body: some View {
        ImageButton(image: "trash", color: .green) {
            action()
        }
        .rotationEffect(.degrees(animated ? -30 : 0))
        .animation(
            .interpolatingSpring(
                stiffness: 650,
                damping: 10,
                initialVelocity: 50
            ),
            value: animated
        )
    }
}

//MARK: - DeliveryView
struct DeliveryView: View {
    @Binding var alertIsPresented: Bool
    var deliveryAmount: String
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text("Доставка")
            ImageButton(image: "info.circle", color: .gray) {
                action()
            }
            .alert(
                "Доставка",
                isPresented: $alertIsPresented,
                actions: { Button("Закрыть", action: {}) },
                message: { Text("Бесплатная доставка от 5000 ₽") }
            )
            Spacer()
            Text(deliveryAmount)
        }
        .font(.title2)
    }
}

//MARK: - OrderButton
struct OrderButton: View {
    var totalAmount: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Оформить заказ")
            Spacer()
            Text(totalAmount)
        }
        .padding()
        .frame(height: 70)
        .background(Color.green)
        .foregroundStyle(Color.white)
        .font(.title2)
        .bold()
        .clipShape(
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
        )
    }
}



#Preview {
    OrderCartView(viewModel: OrderCartViewModel(rows: []))
}
