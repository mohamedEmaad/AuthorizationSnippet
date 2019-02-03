//
//  GridienView.swift
//  EstsharaProject
//
//  Created by Mohamed Emad on 11/14/18.
//  Copyright © 2018 Baianat. All rights reserved.
//

import UIKit

@IBDesignable open class GridienView: UIView {
    
    var startColor: UIColor {
        get{
            return #colorLiteral(red: 0.3215686275, green: 0.6196078431, blue: 0.9461183236, alpha: 1)
        }
        set(newValue) {
            self.setGredient(startColor: newValue)
        }
    }
    
    var endColor = #colorLiteral(red: 0.9816294552, green: 0.9744679968, blue: 0.9950830397, alpha: 1)
    
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setGredient(startColor: self.startColor)
        
    }
    
    func setGredient(startColor: UIColor){
        let gradientLayer = self.layer as! CAGradientLayer
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.autoreverses = true
        gradientLayer.locations = [0.0, 1.0]
    }
    
}
