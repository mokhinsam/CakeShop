//
//  LayerCakeView.swift
//  CakeShop
//
//  Created by Дарина Самохина on 13.02.2025.
//

import SwiftUI

struct LayerCakeView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            
            //MARK: Top layer of cake
            Path { path in
                path.move(to: CGPoint(x: size * 0.3, y: size * 0.55))
                path.addLine(to: CGPoint(x: size * 0.3, y: size * 0.35))
                path.addLine(to: CGPoint(x: size * 0.7, y: size * 0.35))
                path.addLine(to: CGPoint(x: size * 0.7, y: size * 0.55))
                path.addLine(to: CGPoint(x: size * 0.3, y: size * 0.55))
            }
            .fill(
                LinearGradient(
                    colors: [Color.white, Color.yellow],
                    startPoint: UnitPoint(x: 0, y: 1),
                    endPoint: UnitPoint(x: 1, y: 0.5)
                )
            )

            Path { path in
                path.move(to: CGPoint(x: size * 0.3, y: size * 0.45))
                path.addCurve(
                    to: CGPoint(x: size * 0.7, y: size * 0.45),
                    control1: CGPoint(x: size * 0.26, y: size * 0.6),
                    control2: CGPoint(x: size * 0.74, y: size * 0.3)
                )
            }
            .stroke(Color.white, lineWidth: size * 0.01)
            
            //MARK: Middle layer of cake
            Path { path in
                path.move(to: CGPoint(x: size * 0.2, y: size * 0.75))
                path.addLine(to: CGPoint(x: size * 0.2, y: size * 0.55))
                path.addLine(to: CGPoint(x: size * 0.8, y: size * 0.55))
                path.addLine(to: CGPoint(x: size * 0.8, y: size * 0.75))
            }
            .fill(
                LinearGradient(
                    colors: [Color.white, Color.pink.opacity(0.8)],
                    startPoint: UnitPoint(x: 0, y: 1),
                    endPoint: UnitPoint(x: 1, y: 0.5)
                )
            )
            
            Path { path in
                path.move(to: CGPoint(x: size * 0.2, y: size * 0.65))
                path.addCurve(
                    to: CGPoint(x: size * 0.8, y: size * 0.65),
                    control1: CGPoint(x: size * 0.25, y: size * 0.8),
                    control2: CGPoint(x: size * 0.75, y: size / 2)
                )
            }
            .stroke(Color.white, lineWidth: size * 0.01)
            
            //MARK: Bottom layer of cake
            Path { path in
                path.move(to: CGPoint(x: size * 0.1, y: size))
                path.addLine(to: CGPoint(x: size * 0.1, y: size * 0.75))
                path.addLine(to: CGPoint(x: size * 0.9, y: size * 0.75))
                path.addLine(to: CGPoint(x: size * 0.9, y: size))
            }
            .fill(
                LinearGradient(
                    colors: [Color.white, Color.cyan],
                    startPoint: UnitPoint(x: 0, y: 1),
                    endPoint: UnitPoint(x: 1, y: 0.5)
                )
            )
            
            Path { path in
                path.move(to: CGPoint(x: size * 0.1, y: size * 0.85))
                path.addCurve(
                    to: CGPoint(x: size * 0.9, y: size * 0.9),
                    control1: CGPoint(x: size * 0.25, y: size * 1.1),
                    control2: CGPoint(x: size * 0.75, y: size * 0.65)
                )
            }
            .stroke(Color.white, lineWidth: size * 0.01)
            
            //MARK: Plate
            Path { path in
                path.move(to: CGPoint(x: 0, y: size * 0.975))
                path.addLine(to: CGPoint(x: size * 0.025, y: size))
                path.addLine(to: CGPoint(x: size * 0.975, y: size))
                path.addLine(to: CGPoint(x: size, y: size * 0.975))
            }
            .fill(Color.gray)
        }
    }
}

#Preview {
    LayerCakeView()
        .frame(width: 200, height: 200)
}
