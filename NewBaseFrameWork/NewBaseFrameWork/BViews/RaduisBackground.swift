//
//  RaduisBackground.swift
//  EstsharaProject
//
//  Created by Mohamed Emad on 11/17/18.
//  Copyright © 2018 Baianat. All rights reserved.
//

import UIKit

@IBDesignable open class RadiusBackground: UIView {
    
    private lazy var dashView: CAShapeLayer = {
        let yourViewBorder = CAShapeLayer()
        yourViewBorder.strokeColor = Colors.primaryColor.cgColor
        yourViewBorder.lineDashPattern = [3, 3]
        yourViewBorder.frame = self.bounds
        yourViewBorder.fillColor = nil
        
        yourViewBorder.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.cornerRadius).cgPath
        
        return yourViewBorder
    }()
    
    @IBInspectable public var backgroundcolor: UIColor = .white {
        didSet{
            self.layer.backgroundColor = backgroundcolor.cgColor
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 5.0{
        didSet{
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable public var cornerWidth: CGFloat = 0.5{
        didSet{
            self.layer.borderWidth = cornerWidth
            self.layer.masksToBounds = true
        }
    }
    
    /// set dashed line raduis background for the view
    @IBInspectable public var isDashed: Bool = false{
        didSet{
            isDashed ? self.layer.addSublayer(dashView) : dashView.removeFromSuperlayer()
        }
    }
    
    @IBInspectable public var borderColor: UIColor = Colors.primaryColor{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    /// for programatically initailization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    /// for storyboard initialization
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    /// is called within the Storyboard editor itself for rendering @IBDesignable controls
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    /**
     set the background border and border color
     */
    func setupView(){
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = 0.5
        self.layer.borderColor = self.borderColor.cgColor
        self.layer.backgroundColor = backgroundcolor.cgColor
        self.layer.frame.size = CGSize(width: self.layer.frame.width, height: self.frame.size.height)
        self.layer.masksToBounds = true
    }
    
}
