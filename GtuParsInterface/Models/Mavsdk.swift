//
//  Mavsdk.swift
//  GtuParsInterface
//
//  Created by Bahadır Büber on 22.06.2021.
//

import Foundation
import Mavsdk
import RxSwift

let MavScheduler = ConcurrentDispatchQueueScheduler(qos: .default)

class Mavsdk: ObservableObject {
    //Sınıfın ObservableObject olması değişkenleri gözlemlenebilir yapıyor.
    static let sharedInstance = Mavsdk()
    var drone: Drone
    private init() {
        drone = Drone(address: "0.0.0.0",port: 50051)
        /*Programı çalıştırmadan önce MAVProxy ile telemetri bilgisayara bağlıyken USB portunu
         birden fazla çıkışa vermemiz gerekiyor.
         */
        /*
         sudo mavproxy.py --master=/dev/tty.usbmodem141201 --out=udp:127.0.0.1:14540
         Yukarıdaki kod USBden alınan girişi localhostta 14540 portlu yeni UDP bağlantısı oluşturur.
         */
        /*Daha sonra yeni çıkıştan Mavsdk Server başlatıyoruz.
         Terminale mavsdk_server yazdığımızda 14540 portundan aldığı bağlantıyla 50051 portlu yeni
         Mavsdk Server başlatır.
         */
        //Programı başlatırken Model ile Mavsdk Server'a bağlanıyoruz.
    }
}
