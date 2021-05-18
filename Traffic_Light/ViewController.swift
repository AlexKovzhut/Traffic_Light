//
//  ViewController.swift
//  Traffic_Light
//
//  Created by Alexander Kovzhut on 17.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redColorView: UIView!
    @IBOutlet weak var yellowColorView: UIView!
    @IBOutlet weak var greenColorView: UIView!
    @IBOutlet weak var nextPressedButton: UIButton!
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        redColorView.alpha = 0.3
        yellowColorView.alpha = 0.3
        greenColorView.alpha = 0.3
        
      }
    
    
    
    @IBAction func startPressedButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            
            redColorView.alpha = 1
            yellowColorView.alpha = 0.3
            greenColorView.alpha = 0.3
            
            nextPressedButton.setTitle("NEXT", for: .normal)
        } else {
            redColorView.alpha = 0.3
            yellowColorView.alpha = 1
            greenColorView.alpha = 0.3
            
        }
        }
        
    
    
    
    
    
    
    @IBAction func stopPressedButton(_ sender: UIButton) {
        
        redColorView.alpha = 0.3
        yellowColorView.alpha = 0.3
        greenColorView.alpha = 0.3
        
        nextPressedButton.setTitle("START", for: .normal)
    }
}

