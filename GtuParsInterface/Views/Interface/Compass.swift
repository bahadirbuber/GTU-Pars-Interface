//
//  Compass.swift
//  GtuParsInterface
//
//  Created by Bahadır Büber on 25.06.2021.
//

import SwiftUI

struct Compass: View {
    var geoWidth: CGFloat
    var geoHeight: CGFloat
    let yawAngle: Double
    var body: some View {
        ZStack{
            //Pusula ile uçak farklı resimlerdir.
            Image("compass")
                .resizable(capInsets: EdgeInsets())
                .aspectRatio(contentMode: .fill)
                .frame(width: geoWidth, height: geoHeight,alignment: .center).padding()
            //Uçak fotoğrafı küçültülmüştür.
            Image("PlaneForCompass")
                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: geoWidth/2, height: geoHeight/2,alignment: .center).padding()
                .rotationEffect(Angle(degrees: yawAngle), anchor: .center).animation(.easeInOut)
        }
    }
}

