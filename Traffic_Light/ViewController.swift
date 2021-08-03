//
//  ViewController.swift
//  Traffic_Light
//
//  Created by Alexander Kovzhut on 17.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    enum  ColorLight {
        case red,yellow,green
    }
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var redUIView: UIView!
    @IBOutlet weak var yellowUIView: UIView!
    @IBOutlet weak var greenUIView: UIView!
    
    private var currentLight = ColorLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.2

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 15
        stopButton.layer.cornerRadius = 15
        
        redUIView.alpha = lightIsOff
        yellowUIView.alpha = lightIsOff
        greenUIView.alpha = lightIsOff
    }
    
    override func viewDidLayoutSubviews() {
        redUIView.makeRounded()
        yellowUIView.makeRounded()
        greenUIView.makeRounded()
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            redUIView.alpha = lightIsOn
            currentLight = .yellow
            greenUIView.alpha = lightIsOff
        case .yellow:
            redUIView.alpha = lightIsOff
            yellowUIView.alpha = lightIsOn
            currentLight = .green
        case .green:
            currentLight = .red
            yellowUIView.alpha = lightIsOff
            greenUIView.alpha = lightIsOn
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        startButton.setTitle("START", for: .normal)
        
        currentLight = .red
        
        redUIView.alpha = lightIsOff
        yellowUIView.alpha = lightIsOff
        greenUIView.alpha = lightIsOff
    }
}

extension UIView {
        func makeRounded() {
            self.layoutIfNeeded()
            self.layer.cornerRadius = self.frame.size.width * 0.50
            self.clipsToBounds = true
            self.layer.borderWidth = 2
            self.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
        }
}
