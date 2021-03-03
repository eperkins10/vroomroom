//
//  Car.swift
//  Vroom Vroom
//
//  Created by Tanner Perry on 1/23/21.
//  Copyright © 2021 Tanner Perry. All rights reserved.
//

import Foundation


import Foundation


public enum Origin {
    case american
    case japanese
    case german
    case italian
    case swiss
    case UK
}

public enum DriveType {
    case twoWheelDrive
    case fourWheelDrive
}

public enum Manufacturer {
    case Audi
    case Dodge
    case Ferarri
    case Koenigsegg
    case Lamborghini
    case Lexus
    case Mclaren
    case Nissan
    case Porshe
}

public class Car {
    private var carModel : String
    private var carOrigin : Origin
    private var driveType : DriveType
    private var cylinderCount : Int
    private var manufacturer : Manufacturer
    private var urlName : String
    
    public init (carModel:String, carOrigin:Origin, driveType:DriveType, cylinderCount:Int, manufacturer:Manufacturer,
        urlName:String) {
        self.carModel = carModel
        self.carOrigin = carOrigin
        self.driveType = driveType
        self.cylinderCount = cylinderCount
        self.manufacturer = manufacturer
        self.urlName = urlName
    }
}


 var CarList = [Car(carModel: "RS7", carOrigin: .german, driveType: .fourWheelDrive, cylinderCount: 8, manufacturer: .Audi, urlName: "Audi RS7"),
                Car(carModel: "S4", carOrigin: .german, driveType: .fourWheelDrive, cylinderCount: 6, manufacturer: .Audi, urlName: "Audi S4"),
                Car(carModel: "Hellcat", carOrigin: .american, driveType: .twoWheelDrive, cylinderCount: 8, manufacturer: .Dodge, urlName: "Dodge Hellcat"),
                Car(carModel: "458", carOrigin: .italian, driveType: .twoWheelDrive, cylinderCount: 8, manufacturer: .Ferarri, urlName: "Ferarri 458"),
                Car(carModel: "Agera RS", carOrigin: .swiss, driveType: .twoWheelDrive, cylinderCount: 8, manufacturer: .Koenigsegg, urlName: "Koenigsegg Agera R"),
                Car(carModel: "Aventador", carOrigin: .italian, driveType: .fourWheelDrive, cylinderCount: 12, manufacturer: .Lamborghini, urlName: "Lamborghini Aventador"),
                Car(carModel: "LFA", carOrigin: .japanese, driveType: .twoWheelDrive, cylinderCount: 10, manufacturer: .Lexus, urlName: "Lexus LFA"),
                Car(carModel: "P1", carOrigin: .UK, driveType: .fourWheelDrive, cylinderCount: 8, manufacturer: .Mclaren, urlName: "Mclaren P1"),
                Car(carModel: "GTR", carOrigin: .japanese, driveType: .fourWheelDrive, cylinderCount: 6, manufacturer: .Nissan, urlName: "Nissan R35 GT-R"),
                Car(carModel: "Carrera GT", carOrigin: .german, driveType: .twoWheelDrive, cylinderCount: 10, manufacturer: .Porshe, urlName: "Porshe Carrera GT")
     ]
