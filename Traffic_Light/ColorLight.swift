//
//  ColorLight.swift
//  Traffic_Light
//
//  Created by Alexander Kovzhut on 03.08.2021.
//

import Foundation

struct Color {
    enum  ColorLight {
        
        case red,yellow,green
    }
    
    private var currentLight = ColorLight.red

    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.2

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
