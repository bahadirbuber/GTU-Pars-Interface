//
//  Compass.swift
//  GtuParsInterface
//
//  Created by Bahadır Büber on 24.06.2021.
//

import SwiftUI


struct Altitude: View {
    var geoWidth: CGFloat
    var geoHeight: CGFloat
    let altitude: Double
    var body: some View {
        ZStack{
            //Gösterge ile  ibre farklı Viewlardır.
            Image("altitude")
                .resizable(capInsets: EdgeInsets())
                .aspectRatio(contentMode: .fill)
                .frame(width: geoWidth, height: geoHeight,alignment: .center).padding()
            Text("\(String(format: "%.2f m", altitude))").font(Font.custom("Lemon Milk", size: 35))
                .offset(x: 50.0, y: 110.0)
                .multilineTextAlignment(.center)
                .frame(width: geoWidth, height: geoHeight, alignment: .center).padding()
            //İbreye hız değişkeni ve programın çerçevesine göre değişmesi için çerçeve boyutu verilmiştir.
            AirNeedleView(angle: altitude, geoWidth: geoWidth, geoHeight: geoHeight)
        }
    }
}

