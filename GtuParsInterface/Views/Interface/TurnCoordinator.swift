//
//  TurnCoordinator.swift
//  GtuParsInterface
//
//  Created by Bahadır Büber on 25.07.2021.
//

import SwiftUI

struct TurnCoordinator: View {
    var geoWidth: CGFloat
    var geoHeight: CGFloat
    let rollAngle: Double
    var body: some View {
        ZStack {
            Image("turnCoordinator")
                .resizable(capInsets: EdgeInsets())
                .aspectRatio(contentMode: .fill)
                .frame(width: geoWidth, height: geoHeight,alignment: .center).padding()
            if(rollAngle > 20){
                Image("turnPlane")
                    .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geoWidth/1.7, height: geoHeight/1.7,alignment: .center).padding()
                    .rotationEffect(Angle(degrees: (20))).animation(.easeInOut)
                Image("turnBall")
                    .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geoWidth/10, height: geoHeight/10,alignment: .center).padding()
                    .offset(x: 52, y: 125)
            }
            else if (rollAngle < -20){
                Image("turnPlane")
                    .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geoWidth/9.5, height: geoHeight/9.5,alignment: .center).padding()
                    .rotationEffect(Angle(degrees: (-20))).animation(.easeInOut)
                Image("turnBall")
                    .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geoWidth/9.5, height: geoHeight/9.5,alignment: .center).padding()
                    .offset(x: -52, y: 125)
            }
            else {
                Image("turnPlane")
                    .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geoWidth/1.7, height: geoHeight/1.7,alignment: .center).padding()
                    .rotationEffect(Angle(degrees: (rollAngle))).animation(.easeInOut)
                Image("turnBall")
                    .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geoWidth/9.5, height: geoHeight/9.5,alignment: .center).padding()
                    .offset(x: CGFloat(rollAngle*2.5), y: 125)
            }
            
            
               
        }
        
    }
}



