//
//  GredientColor.swift
//  EstsharaProject
//
//  Created by Mohamed Emad on 11/14/18.
//  Copyright © 2018 Baianat. All rights reserved.
//

import UIKit

open class GredientColor {
    var gl:CAGradientLayer!
    
    init() {
        let colorTop = #colorLiteral(red: 0.4078431373, green: 0.662745098, blue: 0.8862745098, alpha: 1)
        let colorBottom = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9843137255, alpha: 1)
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}
