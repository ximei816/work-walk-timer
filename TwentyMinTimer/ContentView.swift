//
//  ContentView.swift
//  TwentyMinTimer
//  Copyright © 2020 NM. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    
    @Binding var isTime: Bool
    @State var timeRemaining = 1200
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        Text("Remaining \(timeRemaining / 60) min")
        .onAppear(perform: {
            if UserDefaults.standard.integer(forKey: "workTime") > 0 {
                self.timeRemaining = UserDefaults.standard.integer(forKey: "workTime") * 60
            }
        })
        .onReceive(timer) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 10
            } else {
                Sounds.playSounds(soundfile: "shishiodoshi", loop: 0)
                self.isTime = true
            }
        }
    }
}

struct ContentView: View {
    
    @State private var title: String = "Walking"
    @State private var isWorking: Bool = false
    @State private var isTime: Bool = false
    @State private var showModal: Bool = false
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        VStack {
            Text(title).font(.title)
            
            if isWorking {
                TimerView(isTime: $isTime)
                
                Image("working")
                
                if isTime {
                    Button(action: {
                        self.title = "Walking"
                        self.isWorking.toggle()
                        Sounds.playSounds(soundfile: "walkmusic", loop: -1)
                    }, label: {
                        VStack {
                            Text("Time to walk")
                            Text("Start Walking")
                        }
                    })
                    .padding(50)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.green)
                            .scaleEffect(animationAmount)
                            .opacity(Double(2 - animationAmount))
                            .animation(
                                Animation.easeOut(duration: 1)
                                    .repeatForever(autoreverses: false)
                            )
                    )
                    .onAppear {
                        self.animationAmount = 2
                    }
                } else {
                    Button(action: {
                        self.isTime = true
                    }, label: {
                        Image(systemName: "stop.circle").font(.largeTitle)
                    })
                }
            } else {
                Image("walking")
                
                Button(action: {
                    self.title = "Working"
                    self.animationAmount = 1.0
                    self.isTime = false
                    Sounds.stopSound()
                    self.isWorking.toggle()
                }, label: {
                    Text("Start Working").font(.title)
                })
                .padding(20)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                HStack (spacing: 20) {
                    Button(action: {
                        self.showModal = true
                    }, label: {
                        Image(systemName: "timer").font(.largeTitle)
                    }).sheet(isPresented: self.$showModal){
                        TimeSettingView()
                    }
                    
                    Button(action: {
                        Sounds.stopSound()
                    }, label: {
                        Image(systemName: "stop.circle").font(.largeTitle)
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
