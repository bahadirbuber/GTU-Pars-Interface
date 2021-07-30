//
//  Speedometer.swift
//  GtuParsInterface
//
//  Created by Bahadır Büber on 24.06.2021.
//

import SwiftUI

struct Speedometer: View {
    let geoWidth:CGFloat
    let geoHeight: CGFloat
    let speed: Double
    var body: some View {
        ZStack {
            //Gösterge fotoğrafı çerçeveye göre ayarlanmıştır.
            Image("speedometer")
                .resizable(capInsets: EdgeInsets())
                .aspectRatio(contentMode: .fill)
                .frame(width: geoWidth, height: geoHeight,alignment: .center).padding()
            Text("\(String(format: "%.2f", speed)) m/s").font(Font.custom("Lemon Milk", size: 35))
                .offset(x: 50.0, y: 110.0)
                .multilineTextAlignment(.center)
                .frame(width: geoWidth, height: geoHeight, alignment: .center).padding()
            //İbreye hız değişkeni ve programın çerçevesine göre değişmesi için çerçeve boyutu verilmiştir.
            AirNeedleView(angle: speed, geoWidth: geoWidth, geoHeight: geoHeight)
        }
    }
}

