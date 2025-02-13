//
//  CakeRow.swift
//  CakeShop
//
//  Created by Дарина Самохина on 13.02.2025.
//

import SwiftUI

struct CakeRow: View {
    @ObservedObject var viewModel: CakeRowViewModel

    var body: some View {
        HStack {
            Image(viewModel.cakeImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 160)
                .clipped()
            VStack(alignment: .trailing) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(viewModel.cakeTitle)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text(viewModel.cakeWeight)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    ImageButton(
                        image: "heart.fill",
                        color: viewModel.isFavorite ? .red : .gray
                    ) {
                        viewModel.favoriteButtonPressed()
                    }
                }
                Spacer()
                HStack {
                    if viewModel.cakeCount == 0 {
                        CostButton(cost: viewModel.cakeCostTitle) {
                            viewModel.costButtonPressed()
                        }
                    } else {
                        StepperView(count: $viewModel.cakeCount)
                    }
                }
            }
        }
        .padding()
        .frame(height: 200)
        .overlay(
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .stroke(
                    Color.gray.opacity(0.5),
                    lineWidth: 1
                )
        )
        .shadow(radius: 2)
    }
}


//MARK: - StepperView
struct StepperView: View {
    @Binding var count: Int
    
    var body: some View {
        Stepper("", value: $count)
            .labelsHidden()
        Text("\(count)")
            .frame(width: 35)
            .multilineTextAlignment(.center)
            .bold()
    }
}

//MARK: - CostButton
struct CostButton: View {
    var cost: String
    var action: () -> Void
    
    var body: some View {
        Button(cost) {
            action()
        }
        .buttonStyle(BorderedButtonStyle())
        .background(Color.black)
        .foregroundStyle(Color.white)
        .bold()
        .clipShape(
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
        )
    }
}

#Preview {
    CakeRow(
        viewModel: CakeRowViewModel(
            cake: Cake(
                title: "Любимый оригинальный",
                weight: 1400,
                cost: 1765,
                image: "favoriteOriginal"
            )
        )
    )
}
