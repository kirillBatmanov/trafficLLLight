//
//  ViewController.swift
//  trafficLLLight
//
//  Created by Кирилл Батманов on 04.09.2021.
//

import UIKit

enum Lights {
    case red, orange, green
}

class ViewController: UIViewController {
    
    @IBOutlet var redLightView: UIView!
    @IBOutlet var orangeLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = Lights.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 10
        
        redLightView.alpha = lightIsOff
        orangeLightView.alpha = lightIsOff
        greenLightView.alpha = lightIsOff
        
    }
    
    override func viewWillLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        orangeLightView.layer.cornerRadius = orangeLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
        
    }
    
    @IBAction func startButtonPressed() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenLightView.alpha = lightIsOff
            redLightView.alpha = lightIsOn
            currentLight = .orange
            
        case .orange:
            redLightView.alpha = lightIsOff
            orangeLightView.alpha = lightIsOn
            currentLight = .green
            
        case .green:
            orangeLightView.alpha = lightIsOff
            greenLightView.alpha = lightIsOn
            currentLight = .red
            
        }

    }
    
}

