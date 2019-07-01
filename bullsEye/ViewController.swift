//
//  ViewController.swift
//  bullsEye
//
//  Created by MacOS on 12/3/18.
//  Copyright © 2018 MacOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0
    var targetValue:Int = 0
    var score = 0
    var numberOfRound = 0
    
    @IBOutlet weak var  slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var numberOfRoundLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        targetValue = Int.random(in: 1...100)
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftImageResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftImageResizable, for: .normal)
        
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightImageResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightImageResizable, for: .normal)
    }

    @IBAction func showAlert(){
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
       
        
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..." }
         score += points
        
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil
        //{
            //action in
            //self.startNewRound()
        
 //   }
        )
        
        alert.addAction(action)
        present(alert,animated: true, completion: nil)
        startNewRound()
        
    }
    
    @IBAction func sliderMover(slider: UISlider)
    {
      
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        
    }
    func startNewRound(){
        
        numberOfRound += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        
    }
    func updateLabels()
    {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        numberOfRoundLabel.text = String(numberOfRound)
    }
    
    @IBAction func startNewGame() {
        score = 0
        numberOfRound = 0
        startNewRound()
        
    }
}

