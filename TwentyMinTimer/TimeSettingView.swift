//
//  TimeSettingView.swift
//  TwentyMinTimer
//  Copyright © 2020 NM. All rights reserved.
//

import SwiftUI

struct TimeSettingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var workTime: String = ""
    
    var body: some View {
        VStack (spacing: 20) {
            HStack {
                TextField("Working time duration (min)", text: $workTime)
                    .frame(width: 200, height: 30, alignment: .center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                Text("min")
            }
            Button(action: {
                UserDefaults.standard.set(Int(self.workTime), forKey: "workTime")
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Update")
            })
        }.onAppear(perform: {self.workTime = String(UserDefaults.standard.integer(forKey: "workTime"))})
    }
}

struct TimeSettingView_Previews: PreviewProvider {
    static var previews: some View {
        TimeSettingView()
    }
}
