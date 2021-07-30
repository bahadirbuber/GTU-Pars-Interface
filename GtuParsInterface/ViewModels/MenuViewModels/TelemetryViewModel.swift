//
//  TelemetryViewModel.swift
//  GtuParsInterface
//
//  Created by Bahadır Büber on 22.06.2021.
//

import Foundation
import RxSwift
import Mavsdk

final class TelemetryViewModel: ObservableObject {
    @Published private(set) var altitude = 0.0
    @Published private(set) var battery = 0.0
    @Published private(set) var rollAngle = 0.0
    @Published private(set) var yawAngle = 0.0
    @Published private(set) var pitchAngle = 0.0
    @Published private(set) var airspeed = 0.0
    @Published private(set) var climbRate = 0.0
    @Published private(set) var isArmed = false
    @Published private(set) var flightMode = "-"
    @Published private(set) var gpsNum = 0
    
    lazy var drone = Mavsdk.sharedInstance.drone
    let disposeBag = DisposeBag()//RxSwift Dispose Bag
    
    init() {
        getDroneTelemetry()
    }
    
    func getDroneTelemetry() {
        drone.telemetry.position
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (position) in
                self.altitude = Double(position.relativeAltitudeM)
            })
            .disposed(by: disposeBag)
        
        drone.telemetry.battery
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (info) in
                self.battery = Double(info.remainingPercent * 100)
            })
            .disposed(by: disposeBag)
        
        drone.telemetry.attitudeEuler
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (angle) in
                self.rollAngle = Double(angle.rollDeg)
                self.yawAngle = Double(angle.yawDeg)
                self.pitchAngle = Double(angle.pitchDeg)
            }).disposed(by: disposeBag)
        drone.telemetry.fixedwingMetrics
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (metrics) in
                self.airspeed = Double(metrics.airspeedMS)
                self.climbRate = Double(metrics.climbRateMS)
            }).disposed(by: disposeBag)
        drone.telemetry.armed
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (armed) in
                self.isArmed = armed
            })
            .disposed(by: disposeBag)
        
        drone.telemetry.gpsInfo
            .subscribeOn(MavScheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (gps) in
                self.gpsNum = Int(gps.numSatellites)
            })
            .disposed(by: disposeBag)
    }
    
}

