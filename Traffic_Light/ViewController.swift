//
//  ViewController.swift
//  Traffic_Light
//
//  Created by Alexander Kovzhut on 17.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var redUIView: UIView!
    @IBOutlet weak var yellowUIView: UIView!
    @IBOutlet weak var greenUIView: UIView!
    
    var isFadeOn = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redUIView.alpha = 0.3
        yellowUIView.alpha = 0.3
        greenUIView.alpha = 0.3
        
    }
    
    
  
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
       
        
    }

}
