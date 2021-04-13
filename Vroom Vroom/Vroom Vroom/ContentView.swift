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
    @State private var showingAlert = true
    
    var body: some View {
        
        
        NavigationView{
            ZStack{
                VStack{
                    Button("") {
                        showingAlert = true
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Wait! Before you play"), message: Text("Please turn your phone off of silent mode"), dismissButton: .default(Text("Got it!")))
                    }
                    
                    List {
                        ForEach(self.originOfCars.sorted(), id: \.self) { option in
                            NavigationLink(destination:
                                            Quiz(carType: option, availableCarList: Car.CarList.filter {(($0.carOrigin == Origin(rawValue: option)) || (option == "All")) } )) {
                                Text(option)
                                    .bold()
                                    .font(.title)
                                    .frame(width: 300.0, height: 70)
                            }
                        }
                    }
                    Spacer()
                }
            } .navigationBarTitle("Vroom Vroom")
        }
        
    }
    
}


struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
                    ContentView().preferredColorScheme($0)
        }
    }
}
