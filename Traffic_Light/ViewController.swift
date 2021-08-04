//
//  ViewController.swift
//  Traffic_Light
//
//  Created by Alexander Kovzhut on 17.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var redUIView: UIView!
    @IBOutlet weak var yellowUIView: UIView!
    @IBOutlet weak var greenUIView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var yellowLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    
    private var currentLight = ColorLight.red
    
    private let lightOn: CGFloat = 1
    private let lightOff: CGFloat = 0.2
    private let lightToZero: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        startButton.makeButton("Start")
        stopButton.makeButton("Reset")

        redUIView.makeView(.red, lightOff)
        redLabel.makeLabel("Stop")
        
        yellowUIView.makeView(.yellow, lightOff)
        yellowLabel.makeLabel("Wait")
        
        greenUIView.makeView(.green, lightOff)
        greenLabel.makeLabel("Go")
    }
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        startButtonTapped()
    }
    
    @IBAction func stopButtonAction(_ sender: UIButton) {
        stopButtonTapped()
    }
}

extension UIView {
    func makeView(_ color: UIColor,_ alpha: CGFloat) {
        self.alpha = alpha
        self.backgroundColor = color
        
        self.layer.cornerRadius = self.frame.size.width * 0.50
        self.clipsToBounds = true
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.systemOrange.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        }
}

extension UIButton {
    func makeButton(_ name: String) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.systemOrange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = 18
        
        self.layer.addSublayer(gradientLayer)
        self.setTitle(name, for: .normal)
        self.tintColor = UIColor.white
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        self.layer.cornerRadius = 18
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemOrange.cgColor
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
    }
}

extension UILabel {
    func makeLabel(_ title: String) {
        self.text = title
        self.alpha = 0
        self.font = UIFont.boldSystemFont(ofSize: 25)
        self.textColor = UIColor.white
        self.textAlignment = .center
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4.0
        self.layer.shadowOffset = CGSize(width: 7, height: 4)
    }
}

extension ViewController {
    enum  ColorLight {
        case red,yellow,green
    }
    
    func startButtonTapped() {  //change button and views
        if startButton.currentTitle == "Start" {
            startButton.setTitle("Next", for: .normal)
        }
        
        switch currentLight {
        case .red:           //when the color is red
            redUIView.alpha = lightOn
            redLabel.alpha = lightOn
            
            yellowUIView.alpha = lightOff
            yellowLabel.alpha = lightToZero
            
            greenUIView.alpha = lightOff
            greenLabel.alpha = lightToZero
            
            currentLight = .yellow
            
        case .yellow:        //when the color is yellow
            redUIView.alpha = lightOff
            redLabel.alpha = lightToZero
            
            yellowUIView.alpha = lightOn
            yellowLabel.alpha = lightOn
            
            greenUIView.alpha = lightOff
            greenLabel.alpha = lightToZero
            
            currentLight = .green
        case .green:         //when the color is green
            redUIView.alpha = lightOff
            redLabel.alpha = lightToZero
            
            yellowUIView.alpha = lightOff
            yellowLabel.alpha = lightToZero
            
            greenUIView.alpha = lightOn
            greenLabel.alpha = lightOn
            
            currentLight = .red
        }
    }
    
    func stopButtonTapped() {   //reset all changes
        startButton.setTitle("Start", for: .normal)
        
        currentLight = .red
        
        redUIView.alpha = lightOff
        yellowUIView.alpha = lightOff
        greenUIView.alpha = lightOff
        
        redLabel.alpha = lightToZero
        yellowLabel.alpha = lightToZero
        greenLabel.alpha = lightToZero
    }
}
