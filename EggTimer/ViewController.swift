//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes=["Soft":5,"Medium":7,"Hard":12]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var audioPlayer:AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness=sender.currentTitle!
        titleLabel.text=hardness
        progressBar.progress=0
        
        secondsPassed=0
        totalTime=eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(
            timeInterval : 1.0,
            target : self,
            selector : #selector(updateTimer),
            userInfo : nil,
            repeats : true
        )
        //        switch hardness {
        //        case "Soft":
        //            print(softTime)
        //        case "Medium":
        //            print(mediumTime)
        //        case "Hard":
        //            print(hardTime)
        //        default:
        //            print("Error")
        //        }
        //        timer?.invalidate()
        //        var seconds=eggTimes[hardness]!
        //        print("\(seconds) seconds.")
        //        seconds-=1
        //        timer =  Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
        //            print("\(seconds) seconds.")
        //            seconds-=1
        //        }
    }
    @objc func updateTimer(){
        if secondsPassed<totalTime{
            secondsPassed+=1
            progressBar.progress=Float(secondsPassed)/Float(totalTime)
        }else{
            timer.invalidate()
            titleLabel.text="DONE!"
            let url = Bundle.main.url(forResource:"alarm_sound", withExtension:"mp3")
            audioPlayer=try! AVAudioPlayer(contentsOf: url!)
            audioPlayer.play()
        }
    }
}


