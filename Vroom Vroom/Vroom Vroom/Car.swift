//
//  Car.swift
//  Vroom Vroom
//
//  Created by Tanner Perry on 1/23/21.
//  Copyright © 2021 Tanner Perry. All rights reserved.
//

import Foundation

public enum Origin : String, CaseIterable {
    case american = "American"
    case japanese = "Japanese"
    case german = "German"
    case italian = "Italian"
    case swiss = "Swiss"
    case uk = "UK"
}

public enum DriveType {
    case twoWheelDrive
    case fourWheelDrive
}

public enum Manufacturer : String {
    case audi = "Audi"
    case dodge = "Dodge"
    case ferarri = "Ferarri"
    case koenigsegg = "Koenigsegg"
    case lamborghini = "Lamborghini"
    case lexus = "Lexus"
    case mclaren = "Mclaren"
    case nissan = "Nissan"
    case porshe = "Porshe"
}

public class Car {
    public var carModel : String
    public var carOrigin : Origin
    public var driveType : DriveType
    public var cylinderCount : Int
    public var manufacturer : Manufacturer
    public var urlName : String
    
    public init (carModel:String, carOrigin:Origin, driveType:DriveType, cylinderCount:Int, manufacturer:Manufacturer,
        urlName:String) {
        self.carModel = carModel
        self.carOrigin = carOrigin
        self.driveType = driveType
        self.cylinderCount = cylinderCount
        self.manufacturer = manufacturer
        self.urlName = urlName
    }
    
    public var makeAndModel : String {
        get {
            return manufacturer.rawValue + " " + carModel
        }
    }
    
    static var CarList = [Car(carModel: "RS7", carOrigin: .german, driveType: .fourWheelDrive, cylinderCount: 8, manufacturer: .audi, urlName: "audi_rs7"),
                   Car(carModel: "S4", carOrigin: .german, driveType: .fourWheelDrive, cylinderCount: 6, manufacturer: .audi, urlName: "audi_s4"),
                   Car(carModel: "Hellcat", carOrigin: .american, driveType: .twoWheelDrive, cylinderCount: 8, manufacturer: .dodge, urlName: "dodge_hellcat"),
                   Car(carModel: "458", carOrigin: .italian, driveType: .twoWheelDrive, cylinderCount: 8, manufacturer: .ferarri, urlName: "ferarri_458"),
                   Car(carModel: "Agera RS", carOrigin: .swiss, driveType: .twoWheelDrive, cylinderCount: 8, manufacturer: .koenigsegg, urlName: "koenigsegg_agera_r"),
//                   Car(carModel: "Aventador", carOrigin: .italian, driveType: .fourWheelDrive, cylinderCount: 12, manufacturer: .Lamborghini, urlName: "Lamborghini Aventador"),
                   Car(carModel: "LFA", carOrigin: .japanese, driveType: .twoWheelDrive, cylinderCount: 10, manufacturer: .lexus, urlName: "lexus_lfa"),
                   Car(carModel: "P1", carOrigin: .uk, driveType: .fourWheelDrive, cylinderCount: 8, manufacturer: .mclaren, urlName: "mclaren_p1"),
                   Car(carModel: "GTR", carOrigin: .japanese, driveType: .fourWheelDrive, cylinderCount: 6, manufacturer: .nissan, urlName: "nissan_r35_gtr"),
                   Car(carModel: "Carrera GT", carOrigin: .german, driveType: .twoWheelDrive, cylinderCount: 10, manufacturer: .porshe, urlName: "porshe_garrera_gt")
        ]
    
    
}



