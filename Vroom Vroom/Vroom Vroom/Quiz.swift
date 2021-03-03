//
//  Quiz.swift
//  Vroom Vroom
//
//  Created by Tanner Perry on 1/23/21.
//  Copyright © 2021 Tanner Perry. All rights reserved.
//

import Foundation

import SwiftUI
import AVFoundation

class SoundManager {
    var soundPlayer:AVAudioPlayer
    init() {
        soundPlayer = AVAudioPlayer()
    }
    
    func playSoundWith(soundURL:URL) {
        do {
            print("Playing sound at path: \(soundURL.absoluteString)")
            soundPlayer = try AVAudioPlayer.init(contentsOf: soundURL)
            soundPlayer.play()
        } catch  {
            print("Unable to play sound with URL: \(soundURL)")
        }
    }
    
    func stopSound() {
        soundPlayer.stop()
    }
}





struct ResultView: View {
    @Binding var isCorrect: Bool
    @Binding var showingScore: Bool
    
    var body: some View {
        ZStack {
            Color(isCorrect ? .green : .red)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing:20) {
                Text(isCorrect ? "Correct" : "incorrect")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                  
                
        
           
                Button("Next") {
                    //                        self.askQuestion()
                    self.showingScore = false

                }
                .foregroundColor(.black)
          
                .font(.title)
                
                
            }
        }
    }
}




struct Quiz: View {
    
    var audioPlayer: AVAudioPlayer?
    
    var soundManager = SoundManager()
    
    
    
    func playSound(withIndex:Int) {
        
        if let path = Bundle.main.path(forResource: cars[withIndex], ofType: "mp3") {
            print("Path of exhaust: \(path)")
            let url = URL(fileURLWithPath: path)
            soundManager.playSoundWith(soundURL: url)
        }
    }
    
    
    
    @State private var userScore = 0
    @State private var didGetCorrectAnswer = false
    @State public var correctAnswer = Int.random(in: 0...1)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State var isPlaying : Bool = false
    
    
    //    public var carList
    
    @State public  var CarList = [Car(carModel: "RS7", carOrigin: .german, driveType: .fourWheelDrive, cylinderCount: 8, manufacturer: .Audi, urlName: "Audi RS7"),
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
   
    
    
    @State public var cars = ["Audi RS7", "Lamborghini Aventador", "Ferarri 458", "Audi S4", "Dodge Hellcat", "Porshe Carrera GT", "Lexus LFA", "Nissan R35 GT-R", "Mclaren P1", "Koenigsegg Agera R"
    ].shuffled()
    
    var carTypes:String
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 30) {
                    VStack {
                        Text("Guess The Exhaust")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .fontWeight(.black)
                        
                        
                        
                        
                        //                    Text(cars[correctAnswer])
                        //                        .foregroundColor(.white)
                        //                        .font(.largeTitle)
                        //                        .fontWeight(.black)
                        
                        HStack{
                            
                            Button(action: onPlaySoundClicked) {
                                Image(systemName: "play.fill").foregroundColor(.black)
                                    .font(.largeTitle)
                                    .frame(width: 62, height: 62)
                            }
                            
                            Button(action: soundManager.stopSound)  {
                                Image(systemName: "stop.fill").foregroundColor(.black)
                                    .font(.largeTitle)
                                    .frame(width: 60, height: 60)
                            }
                        }
                        
                        
                    }
                    
                    Spacer()
                    
                    ForEach(0 ..< 3) { number in
                        Button(action: {
                            self.exhaustTapped(number)
                            self.askQuestion()
                            self.soundManager.stopSound()
                        }) {
                            
                            Text(self.cars[number])
                                .foregroundColor(.black)
                                .fontWeight(.black)
                                .baselineOffset(50)
                                .font(.largeTitle)
                            
                            
                            
                            
                        }
                        .sheet(isPresented: self.$showingScore){
                            ResultView(isCorrect:self.$didGetCorrectAnswer, showingScore: self.$showingScore)
//                            Button("Next"){
//                                self.askQuestion()
//                                self.soundManager.stopSound()
//                                self.showingScore = false
//
                                    
                                // }
                            
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("Score: \(userScore) |")
                            .font(.largeTitle)
                        Button("Skip"){
                            self.askQuestion()
                            self.soundManager.stopSound()
                            
                        }
                        .font(.largeTitle)
                    }
                }
            }
        }.navigationBarTitle(carTypes)
        
        //        .alert(isPresented: $showingScore) {
        //            Alert(title: Text(scoreTitle), message: Text("Your score is \(UserScore)"), dismissButton: .default(Text("Continue")) {
        //                self.askQuestion()
        //                })
        //        }
    }
    
    func exhaustTapped(_ number: Int) {
        didGetCorrectAnswer = (number == correctAnswer)
        userScore += didGetCorrectAnswer ? 1 : -1
        
        showingScore = true
        
    }
    
    func onPlaySoundClicked() {
        playSound(withIndex: correctAnswer)
    }
    
    func stopSound() {
        if didGetCorrectAnswer == true {
            soundManager.stopSound()
        } else {
            playSound(withIndex: correctAnswer)
        }
    }
    
    public func askQuestion() {
        cars.shuffle()
        correctAnswer = Int.random(in: 0...1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Quiz(carTypes: "Default")
    }
}

