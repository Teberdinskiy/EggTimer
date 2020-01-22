//
//  ViewController.swift
//  EggTimer
//
//  Created by 🧔🏻Alikhan Batchaev on 19.01.2020.
//  Copyright © 2020 Alikhan Batchaev. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var eggProgressBar: UIProgressView!
    
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 720]
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        eggProgressBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = hardness
        titleLabel.textColor = .white
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter(){
        if secondPassed < totalTime {
            secondPassed += 1
            eggProgressBar.progress = Float(secondPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            titleLabel.textColor = .red
            titleLabel.text = "ГОТОВО!"
            
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}





