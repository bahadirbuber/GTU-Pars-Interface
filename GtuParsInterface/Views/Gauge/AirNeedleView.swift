//
//  AirNeedleView.swift
//  GtuParsInterface
//
//  Created by Bahadır Büber on 2.07.2021.
//

import SwiftUI


struct AirNeedleView: View {
    var angle: Double
    let geoWidth:CGFloat
    let geoHeight: CGFloat
    var body: some View {
        //30 değerini geçmemesi için açı hesaplanıp maximum halinde 30 göstermesi sağlanmıştır.
        if (angle*7.22 > 30) {
            GeometryReader { geometry in
                ZStack
                {
                    Image("needle")
                        .resizable(capInsets: EdgeInsets())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geoWidth/3.2, height: geoHeight/3.2,alignment: .center).padding()
                        .offset(x: -geoWidth/7, y: geoHeight/13.7)
                    Circle()
                        .frame(width: geometry.size.width / 35)
                        .offset(x: 5, y: -21)
                }.rotationEffect(Angle(degrees: 0)).animation(.easeInOut)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 1.83)
            }
            //View'a gelen dereceye göre animasyonlu olarak ibre döndüruldü.
            .rotationEffect(Angle(degrees: (30*7.22))).animation(.easeInOut)
        }else{
            GeometryReader { geometry in
                ZStack
                {
                    Image("needle")
                        .resizable(capInsets: EdgeInsets())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geoWidth/3.2, height: geoHeight/3.2,alignment: .center).padding()
                        .offset(x: -geoWidth/7, y: geoHeight/13.7)
                    Circle()
                        .frame(width: geometry.size.width / 35)
                        .offset(x: 5, y: -21)
                        
                }.rotationEffect(Angle(degrees: 0)).animation(.easeInOut)
                
                .position(x: geometry.size.width / 2, y: geometry.size.height / 1.83)
            }
            //View'a gelen dereceye göre animasyonlu olarak ibre döndüruldü.
            .rotationEffect(Angle(degrees: (angle*7.22))).animation(.easeInOut)
        }
    }
}
