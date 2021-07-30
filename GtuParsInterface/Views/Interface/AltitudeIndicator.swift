//
//  AltitudeIndicator.swift
//  GtuParsInterface
//
//  Created by Bahadır Büber on 24.06.2021.
//

import SwiftUI

struct AltitudeIndicator: View {
    var geoWidth: CGFloat
    var geoHeight: CGFloat
    let pitchAngle: Double
    let rollAngle: Double
    var body: some View {
        ZStack{
            Image("IndicatorBackground")
                .resizable(capInsets: EdgeInsets())
                .aspectRatio(contentMode: .fill)
                .offset(y: CGFloat(pitchAngle)*4)
                .clipShape(Circle())
                .frame(width: geoWidth, height: geoHeight, alignment: .center).padding()
                .rotationEffect(Angle(degrees: rollAngle)).animation(.easeInOut)
            Image("kenarliklar")
                .resizable(capInsets: EdgeInsets())
                .aspectRatio(contentMode: .fill)
                .frame(width: geoWidth, height: geoHeight, alignment: .center).padding()
                .rotationEffect(Angle(degrees: rollAngle)).animation(.easeInOut)
                
            Image("attitudeIndicator")
                .resizable(capInsets: EdgeInsets())
                .aspectRatio(contentMode: .fill)
                .frame(width: geoWidth, height: geoHeight, alignment: .center).padding()
                
        }
    }
}


