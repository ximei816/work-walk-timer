//
//  Sounds.swift
//  TwentyMinTimer
//  Copyright © 2020 NM. All rights reserved.
//

import UIKit
import AVFoundation

class Sounds {

    static var audioPlayer:AVAudioPlayer?

    static func playSounds(soundfile: String, loop: Int) {
        let asset = NSDataAsset(name: soundfile)
        
        do{
            audioPlayer = try AVAudioPlayer(data: asset!.data, fileTypeHint: "mp3")
            audioPlayer?.numberOfLoops = loop
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        }catch {
            print("Error")
        }
    }
    
    static func stopSound() {
        audioPlayer?.stop()
    }
}
