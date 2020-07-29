//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //egg times dictionary
    let eggTimes = ["Soft":  300, "Medium": 420 , "Hard": 720]
    
    //timer variables
    var secondsRemaining = 60
    var timer = Timer()
    
    //outlets
    @IBOutlet weak var statusLabel: UILabel!
    
    //Buttons
    @IBAction func hardnessSelected(_ sender: UIButton) {
        //make sure timer isn't running
        timer.invalidate()
        let hardness = sender.currentTitle! //this will never fail, never be nil
        let result = eggTimes[hardness]!
        print(hardness)
        //print(result)
        
       secondsRemaining = result
        
        //counts down according to hardness selected
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector (updateTimer), userInfo: nil, repeats: true )
    }
    
    //helper function for the timer
    @objc func updateTimer() {
           if (secondsRemaining > 0){
               print("\(secondsRemaining) seconds.")
               secondsRemaining -= 1
           }
           else {
            timer.invalidate()
            statusLabel.text = "DONE!"
            }
       }
    
}
