//
//  MenuView.swift
//  GtuParsInterface
//
//  Created by Bahadır Büber on 2.07.2021.
//
import SwiftUI

struct MainView: View {
    @ObservedObject var telemetry = TelemetryViewModel() // View-Model View'la bağlanmıştır.
    var geoWidth: CGFloat // çerçeve büyüklüklerini aldık.
    var geoHeight: CGFloat
    var body: some View {
        //HStack ve VStack ile Basic T düzeni sağlanmıştır.
            HStack{
                VStack{
                    //Hız Göstergesi
                    Speedometer(geoWidth: geoWidth, geoHeight: geoHeight, speed: telemetry.airspeed)
                    //Turn Coordinator
                    TurnCoordinator(geoWidth: geoWidth, geoHeight: geoHeight,rollAngle: telemetry.rollAngle)
                }.padding()
                VStack{
                    AltitudeIndicator(geoWidth: geoWidth, geoHeight: geoHeight, pitchAngle: telemetry.pitchAngle, rollAngle: telemetry.rollAngle)
                    Compass(geoWidth: geoWidth, geoHeight: geoHeight, yawAngle: telemetry.yawAngle).padding()
                }.padding()
                VStack{
                    Altitude(geoWidth: geoWidth, geoHeight: geoHeight, altitude: telemetry.altitude)
                    VerticalSpeed(geoWidth: geoWidth, geoHeight: geoHeight,speed: telemetry.climbRate).padding()
                }.padding()
                Spacer()
            }
    }
}
