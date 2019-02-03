//
//  BButton.swift
//  Tawouk
//
//  Created by Yousef on 7/21/18.
//  Copyright © 2018 Baianat. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class BButton : UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 4.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderwidth: CGFloat = 0.0 {
        didSet{
            self.layer.borderWidth = borderwidth
        }
    }
    
    @IBInspectable var shadowed: Bool = true {
        didSet{
            if shadowed{
                self.layer.masksToBounds = true
            }else{
                self.layer.masksToBounds = false
            }
        }
    }
    
    @IBInspectable var bordercolor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = Colors.primaryColor.cgColor
        }
    }
    
    @IBInspectable public var backgroundcolor: UIColor = Colors.primaryColor {
        didSet{
            self.layer.backgroundColor = backgroundcolor.cgColor
        }
    }
    
    override open var isHighlighted: Bool {
        didSet{
            self.layer.backgroundColor = isHighlighted ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5) : self.backgroundcolor.cgColor
            self.layer.borderColor = isHighlighted ? UIColor.white.cgColor : self.bordercolor.cgColor
            self.setTitleColor(Colors.primaryColor, for: .highlighted)
        }
    }
    
    open override var isEnabled: Bool{
        didSet{
            self.layer.backgroundColor = isEnabled ? self.backgroundcolor.cgColor : UIColor.lightGray.cgColor
            self.layer.borderColor = isEnabled ? self.backgroundcolor.cgColor : UIColor.lightGray.cgColor
            self.setTitleColor(.white, for: .disabled)
        }
    }
    
    override open func awakeFromNib() {
        self.setupView()
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    /**
        setup the view and update the texts
     */
    func setupView() {
        self.layer.borderWidth = borderwidth
        self.layer.borderColor = bordercolor.cgColor
        self.layer.cornerRadius = cornerRadius
        self.layer.backgroundColor = backgroundcolor.cgColor
        
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.26)
        self.layer.shadowOffset = CGSize(width: 0, height: 0.2)
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        
        self.setTitleColor(self.currentTitleColor , for: .normal)
        self.setTitleColor( Colors.primaryColor , for: .highlighted)
        
    }
    
    
    func setUnderline(){
        let attrs = NSAttributedString(string: self.title(for: .normal) ?? "",
                                       attributes: [NSAttributedString.Key.font : self.titleLabel?.font ?? UIFont.systemFont(ofSize: 17.0), NSAttributedString.Key.foregroundColor : self.currentTitleColor,
                                                    NSAttributedString.Key.underlineStyle : 1])
        self.setAttributedTitle(attrs, for: .normal)
    }
    
    @IBInspectable public var setFont: Int = 3 {
        didSet{
            if setFont == 0 {
                self.titleLabel?.font = Fonts.fontLight(size: textSize)
            }else if setFont == 1 {
                self.titleLabel?.font = Fonts.fontRegular(size: textSize)
            }else if setFont == 2 {
                self.titleLabel?.font = Fonts.fontSemiBold(size: textSize)
            }else if setFont == 3{
                self.titleLabel?.font = Fonts.fontSemiBold(size: textSize)
            }else {
                self.titleLabel?.font = Fonts.fontRegular(size: textSize)
            }
        }
    }
    
    @IBInspectable var textSize:CGFloat = UIFont.labelFontSize {
        didSet {
            
            if setFont == 0 {
                self.titleLabel?.font = Fonts.fontLight(size : textSize)
            }else if setFont == 1 {
                self.titleLabel?.font = Fonts.fontRegular( size : textSize)
            }else if setFont == 2 {
                self.titleLabel?.font = Fonts.fontSemiBold(size : textSize)
            }else if setFont == 3{
                self.titleLabel?.font = Fonts.fontSemiBold(size : textSize)
            }else {
                self.titleLabel?.font = Fonts.fontRegular(size : textSize)
            }
            
        }
        
    }
    
    
}





