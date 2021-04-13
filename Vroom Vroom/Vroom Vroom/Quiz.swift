//
//  Quiz.swift
//  Vroom Vroom
//
//  Created by Tanner Perry on 1/23/21.
//  Copyright © 2021 Tanner Perry. All rights reserved.
//

// MARK: Imports
import Foundation
import SwiftUI
import AVFoundation

// MARK: SoundManager
class SoundManager {
    var soundPlayer:AVAudioPlayer
    init() {
        soundPlayer = AVAudioPlayer()
    }
    
    func playSoundWith(soundURL:URL) {
        do {
//            print("Playing sound at path: \(soundURL.absoluteString)")
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

// MARK: Results View
struct ResultView: View {
    
    // MARK: Binding Variables
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
                    self.showingScore = false
                }
                .foregroundColor(.black)
                .font(.title)
            }
        }
    }
}

// MARK: Quiz View
struct Quiz: View {
    
    // MARK: Variables
    var audioPlayer: AVAudioPlayer?
    var soundManager = SoundManager()
    var carType:String
    var availableCarList:[Car]
    
    // MARK: State Variables
    @State private var userScore = 0
    @State private var didGetCorrectAnswer = false
    @State public var correctAnswer = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State var isPlaying : Bool = false
    @State private var choices:[Int] = []

    // MARK: Body
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
                    
                    ForEach(choices, id: \.self) { number in
                        Button(action: {
                            self.exhaustTapped(number)
                            self.askQuestion()
                            self.soundManager.stopSound()
                        }) {
                            
                            Text(self.availableCarList[number].makeAndModel)
                                .foregroundColor(.black)
                                .fontWeight(.black)
                                .baselineOffset(50)
                                .font(.largeTitle)
                        }
                        .sheet(isPresented: self.$showingScore){
                            ResultView(isCorrect:self.$didGetCorrectAnswer, showingScore: self.$showingScore)
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
        }.navigationBarTitle(carType).onAppear(perform: {
            randomize()
        })
    }
    
    // MARK: Quiz Functions
    func playSound(withIndex:Int) {
        
        if let path = Bundle.main.path(forResource: availableCarList[withIndex].urlName, ofType: "mp3") {
//            print("Path of exhaust: \(path)")
            let url = URL(fileURLWithPath: path)
            soundManager.playSoundWith(soundURL: url)
        }
    }
    
    func randomize() {
        // Get our available choices
        getChoices()
        print("Avalable Choices: \(choices)")
        
        // Grab one of the choices that will be the correct answer
        correctAnswer = choices.randomElement() ?? 0
        print("Correct Answer: \(correctAnswer)")
    }
    
    func exhaustTapped(_ number: Int) {
        didGetCorrectAnswer = (number == correctAnswer)
        userScore += didGetCorrectAnswer ? 1 : -1
        
        showingScore = true
        
    }
    
    // MARK: Sound Functions
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
    
    func askQuestion() {
        randomize()
    }
    
    private func getChoices()  {
        var done = false
        choices.removeAll(keepingCapacity: false)
        var newChoices:[Int] = []
        // Loop until we fill our array
        while !done {
            // Grab a random index from 0 to our max car list count (minus 1)
            let index = Int.random(in: 0...availableCarList.count-1)
            
            // See if this index is already in our choice list
            if !newChoices.contains(index) {
                // Not in our choice list so add it
                newChoices.append(index)
            }
            // Once we finally have three available choices, bail
            if newChoices.count == 3 {
                done = true
            }
        }
        choices = newChoices
    }
}

// MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Quiz(carType: "American", availableCarList: Car.CarList)
        }
    }
}

