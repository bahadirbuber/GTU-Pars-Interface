//
//  VerticalNeedleView.swift
//  GtuParsInterface
//
//  Created by Bahadır Büber on 2.07.2021.
//

import SwiftUI

struct VerticalNeedleView: View {
    var angle: Double
    let geoWidth:CGFloat
    let geoHeight: CGFloat
    var body: some View {
        //Düşey hız 18'i geçtiğinde View bozulmaması için koşulla düzeltilmiştir.
        if (angle*10 > 180) {
            GeometryReader { geometry in
                ZStack
                {
                    Image("verticalNeedle")
                        .resizable(capInsets: EdgeInsets())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geoWidth/15, height: geoHeight/15,alignment: .center).padding()
                        .offset(x: -geoWidth/5, y: -geoHeight/17)
                    Circle()
                        .frame(width: geometry.size.width / 35)
                        .offset(x: 2, y: -23.0)
                }.rotationEffect(Angle(degrees: 0)).animation(.easeInOut)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 1.83)
            }
            .rotationEffect(Angle(degrees: 180))
        }else if(angle < -18){
            GeometryReader { geometry in
                ZStack
                {
                    Image("verticalNeedle")
                        .resizable(capInsets: EdgeInsets())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geoWidth/15, height: geoHeight/15,alignment: .center).padding()
                        .offset(x: -geoWidth/5, y: -geoHeight/17)
                    Circle()
                        .frame(width: geometry.size.width / 35)
                        .offset(x: 2, y: -23.0)
                        
                }.rotationEffect(Angle(degrees: 0)).animation(.easeInOut)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 1.83)
            }
            .rotationEffect(Angle(degrees:-180))
        }
        else{
            GeometryReader { geometry in
                ZStack
                {
                    Image("verticalNeedle")
                        .resizable(capInsets: EdgeInsets())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geoWidth/15, height: geoHeight/15,alignment: .center).padding()
                        .offset(x: -geoWidth/5, y: -geoHeight/17)
                    Circle()
                        .frame(width: geometry.size.width / 35)
                        .offset(x: 2, y: -23.0)
                        
                }.rotationEffect(Angle(degrees: 0)).animation(.easeInOut)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 1.83)
            }
            .rotationEffect(Angle(degrees: angle*10))
        }
    }
}

