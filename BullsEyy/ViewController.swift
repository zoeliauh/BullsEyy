//
//  ViewController.swift
//  BullsEyy
//
//  Created by woanjwu liauh on 2021/5/10.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 1
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewGame()
        
        //let thumbImageNormal = #imageLiteral(resourceName: "596DDEC5-01D4-42FF-9E54-28766DD2193F_1_105_c")
       // slider.setThumbImage(thumbImageNormal, for: .normal)
        
       // let thumbImageHighlighted = #imageLiteral(resourceName: "2CE52E9D-FEFB-42A8-890F-7F6EF44DC134_1_105_c")
       // slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
       // let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        //let trackLeftImage = #imageLiteral(resourceName: "2CE52E9D-FEFB-42A8-890F-7F6EF44DC134_1_105_c")
        //let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        //slider.setMinimumTrackImage(trackLeftImage, for: .normal)
        
        //let trackRightImage = #imageLiteral(resourceName: "7AEB8625-D792-447E-95D7-3EAA8AA0B279_1_105_c")
        //let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        //slider.setMaximumTrackImage(trackRightImage, for: .normal)
    }

    @IBAction func showAlert() {
        
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        score += points
        
        round += 1
        
        let title: String
        if difference==0 {
            title = "perfect"
            points += 100
        } else if difference < 5 {
            title = "you almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "you still pretty good!"
        } else {
            title = "not even close..."
        }
        
        let message = "You score \(points) points"
        
        let alert = UIAlertController (title: title, message: message, preferredStyle: .alert)
    
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }

    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
 
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

    @IBAction func startNewGame () {
    score = 0
    round = 0
    startNewRound()
    }
}
