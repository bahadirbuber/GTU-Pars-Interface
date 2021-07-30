//
//  VerticalSpeed.swift
//  GtuParsInterface
//
//  Created by Bahadır Büber on 26.06.2021.
//

import SwiftUI

struct VerticalSpeed: View {
    let geoWidth:CGFloat
    let geoHeight: CGFloat
    let speed: Double
    var body: some View {
        ZStack {
            Image("verticalVelocity")
                .resizable(capInsets: EdgeInsets())
                .aspectRatio(contentMode: .fill)
                .frame(width: geoWidth, height: geoHeight,alignment: .center).padding()
            Text("\(String(format: "%.2f", speed)) m/s").font(Font.custom("Lemon Milk", size: 25))
                .offset(x: 0, y: 60.0)
                .multilineTextAlignment(.center)
                .frame(width: geoWidth, height: geoHeight, alignment: .center).padding()
            VerticalNeedleView(angle: speed, geoWidth: geoWidth, geoHeight: geoHeight)
        }
    }
}

