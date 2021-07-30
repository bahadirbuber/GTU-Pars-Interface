//
//  ContentView.swift
//  GtuParsInterface
//
//  Created by Bahadır Büber on 22.06.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var telemetry = TelemetryViewModel() // View-Model View'a bağlanmıştır.
    var body: some View {
        GeometryReader{ geometry in
            MainView(geoWidth: 3.8*(geometry.size.width/16), geoHeight: 3.8*(geometry.size.height/9))
        }.frame(minWidth: 1280, idealWidth: 1600, maxWidth: .infinity, minHeight: 720, idealHeight: 900, maxHeight: .infinity, alignment: .center)
        //Arkaplan ve uygulamanın çerçeve boyutları belirtilmiştir.
        .background(Image("background2"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //SwiftUI Önizlemesi
    }
}
