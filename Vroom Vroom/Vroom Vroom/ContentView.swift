//
//  ContentView.swift
//  Vroom Vroom
//
//  Created by Tanner Perry on 1/23/21.
//  Copyright © 2021 Tanner Perry. All rights reserved.
//

import SwiftUI

//
//  MainMenu.swift
//  CarExhaustProject
//
//  Created by Tanner Perry on 9/3/20.
//  Copyright © 2020 Tanner Perry. All rights reserved.
//



struct ContentView: View {
    
    @State private var defaultOption = 0
    // Get a list of car
    let originOfCars: [String] = ["All"] + Origin.allCases.map { $0.rawValue }
    
    var body: some View {
        
        
        NavigationView{
            ZStack{
                VStack{
                    
                    
                    List {
                        ForEach(self.originOfCars.sorted(), id: \.self) { option in
                            NavigationLink(destination:
                                            Quiz(carType: option, availableCarList: Car.CarList.filter {(($0.carOrigin == Origin(rawValue: option)) || (option == "All")) } )) {
                                Text(option)
                                    .bold()
                                    .font(.title)
                                    .foregroundColor(.black)
                                    .frame(width: 300.0, height: 70)
                            }
                        }
                    }
                    
                    
                    //                    Spacer()
                    //
                    //                    List(typesOfCars, id:\.self) { carTypes in
                    //
                    //                        NavigationLink(destination:
                    //                        Quiz(carTypes: carTypes)) {
                    //                            Text(carTypes)
                    //                                .font(.title)
                    //                                .foregroundColor(Color.black)
                    //
                    //                                .frame(width: 300.0, height: 50.0)
                    //
                    //
                    //                        }
                    //                    }
                    //                    //                    .colorMultiply(Color.gray)
                    //                    Spacer()
                }
                
            } .navigationBarTitle("vroom vroom")
            
            
            
        }
        
    }
    
}


struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
