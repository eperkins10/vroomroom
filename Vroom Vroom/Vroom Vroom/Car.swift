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
    case bmw = "BMW"
    case chevrolet = "Chevrolet"
    case dodge = "Dodge"
    case ferarri = "Ferarri"
    case ford = "Ford"
    case koenigsegg = "Koenigsegg"
    case lamborghini = "Lamborghini"
    case lexus = "Lexus"
    case mclaren = "Mclaren"
    case mercedezbenz = "Mercedez"
    case nissan = "Nissan"
    case porshe = "Porshe"
    case astonMartin = "Aston Martin"
    case toyota = "Toyota"
    
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
                          Car(carModel: "LFA", carOrigin: .japanese, driveType: .twoWheelDrive, cylinderCount: 10, manufacturer: .lexus, urlName: "lexus_lfa"),
                          Car(carModel: "P1", carOrigin: .uk, driveType: .fourWheelDrive, cylinderCount: 8, manufacturer: .mclaren, urlName: "mclaren_p1"),
                          Car(carModel: "GTR", carOrigin: .japanese, driveType: .fourWheelDrive, cylinderCount: 6, manufacturer: .nissan, urlName: "nissan_r35_gtr"),
                          Car(carModel: "Carrera GT", carOrigin: .german, driveType: .twoWheelDrive, cylinderCount: 10, manufacturer: .porshe, urlName: "porshe_carrera_gt"),
                          Car(carModel: "Silverado LS", carOrigin: .american, driveType: .fourWheelDrive, cylinderCount: 8, manufacturer: .chevrolet, urlName: "chevrolet_ls_silverado_48l"),
                          Car(carModel: "Silverado LBZ", carOrigin: .american, driveType: .fourWheelDrive, cylinderCount: 8, manufacturer: .chevrolet, urlName: "chevrolet_silverado_lbz_duramax"),
                          Car(carModel: "F90", carOrigin: .german, driveType: .twoWheelDrive, cylinderCount: 8, manufacturer: .bmw, urlName: "f90_bmw_m5"),
                          Car(carModel: "F150 Ecoboost", carOrigin: .american, driveType: .fourWheelDrive, cylinderCount: 6, manufacturer: .ford, urlName: "ford_f150_ecoboost"),
                          Car(carModel: "F250 Powerstroke", carOrigin: .american, driveType: .fourWheelDrive, cylinderCount: 8, manufacturer: .ford, urlName: "ford_f250_powerstroke_60"),
                          Car(carModel: "Mustang GT", carOrigin: .american, driveType: .twoWheelDrive, cylinderCount: 8, manufacturer: .ford, urlName: "ford_mustang_gt"),
                          Car(carModel: "E63 AMG", carOrigin: .german, driveType: .twoWheelDrive, cylinderCount: 8, manufacturer: .mercedezbenz, urlName: "mercedez_benz_e63_amg"),
                          Car(carModel: "GT2RS", carOrigin: .german, driveType: .twoWheelDrive, cylinderCount: 6, manufacturer: .porshe, urlName: "porsche_911_gt2rs"),
                          Car(carModel: "GT3RS", carOrigin: .german, driveType: .twoWheelDrive, cylinderCount: 6, manufacturer: .porshe, urlName: "porsche_911_gt3rs"),
                          Car(carModel: "Aventador", carOrigin: .italian, driveType: .twoWheelDrive, cylinderCount: 12, manufacturer: .lamborghini, urlName: "lamborghini_aventador"),
                          Car(carModel: "Huracan", carOrigin: .italian, driveType: .twoWheelDrive, cylinderCount: 10, manufacturer: .lamborghini, urlName: "lamborghini_huracan"),
                          Car(carModel: "Regera", carOrigin: .swiss, driveType: .twoWheelDrive, cylinderCount: 6, manufacturer: .koenigsegg, urlName: "koenigsegg_regera"),
                          Car(carModel: "CCX", carOrigin: .swiss, driveType: .twoWheelDrive, cylinderCount: 8, manufacturer: .koenigsegg, urlName: "koenigsegg_ccx"),
                          Car(carModel: "Vulcan", carOrigin: .uk, driveType: .twoWheelDrive, cylinderCount: 12, manufacturer: .astonMartin, urlName: "astonmartin_vulcan"),
                          Car(carModel: "720S", carOrigin: .uk, driveType: .twoWheelDrive, cylinderCount: 8, manufacturer: .mclaren, urlName: "mclaren_720s"),
                          Car(carModel: "MK4 Supra" , carOrigin: .japanese, driveType: .twoWheelDrive, cylinderCount: 6, manufacturer: .toyota, urlName: "toyota_supra_mk4")
    ]
    
    
}



