//
//  ViewController.swift
//  Xylophone
//
//  Created by Hussain Arthuna on 1/16/19.
//  Copyright © 2019 Hussain Arthuna. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{

    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        let myTag = sender.tag
        
        playSound(myTag: myTag)
        
        
        
    }
    
    func playSound(myTag : Int) {
        
        if let audioPlayer = audioPlayer, audioPlayer.isPlaying {
            audioPlayer.stop()
            
        }
        
        guard let soundURL = Bundle.main.url(forResource: "note\(myTag)", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch let error {
            print(error)
        }
        
    }
  

}

