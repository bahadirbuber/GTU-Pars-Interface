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
    static let sharedInstance = Mavsdk()
    var drone: Drone
    private init() {
        drone = Drone(address: "0.0.0.0",port: 50051)
        //Droneu başlatmak için gerekli kod
    }
}
