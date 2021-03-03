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
    
    public let typesOfCars = ["American", "German", "japanese"]
    
    var body: some View {
        
        
        NavigationView{
            ZStack{
                VStack{
                    Spacer()
                    
                    List(typesOfCars, id:\.self) { carTypes in
                        
                        NavigationLink(destination:
                        Quiz(carTypes: carTypes)) {
                            Text(carTypes)
                                .font(.title)
                                .foregroundColor(Color.black)
                                
                                .frame(width: 300.0, height: 50.0)
                            
                            
                        }
                    }
                    //                    .colorMultiply(Color.gray)
                    Spacer()
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
