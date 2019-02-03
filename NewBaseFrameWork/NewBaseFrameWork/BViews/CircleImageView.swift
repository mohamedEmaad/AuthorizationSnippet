//
//  CircleImageView.swift
//  EstsharaProject
//
//  Created by Mohamed Emad on 11/17/18.
//  Copyright © 2018 Baianat. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class CustomCircleImage: UIImageView {
    
    override open func awakeFromNib() {
        self.circleImage()
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.circleImage()
    }
    
}
