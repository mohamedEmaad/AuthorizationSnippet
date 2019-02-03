//
//  BTextField.swift
//  Tawouk
//
//  Created by Yousef on 7/19/18.
//  Copyright © 2018 Baianat. All rights reserved.
//

import Foundation
import UIKit

open class BTextField : UITextField {
    
    var centered = false
    var paddingVar = UIEdgeInsets(top: 0 , left: 0 , bottom: 0 , right: 0 )
    
    override open func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: paddingVar ))
    }
    
    override open var intrinsicContentSize: CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + paddingVar.left + paddingVar.right
        let heigth = superContentSize.height + paddingVar.top + paddingVar.bottom
        return CGSize(width: width, height: heigth)
    }
    
    // Override -sizeThatFits: for Springs & Struts code
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        let superSizeThatFits = super.sizeThatFits(size)
        
        let width = superSizeThatFits.width + paddingVar.left + paddingVar.right
        let heigth = superSizeThatFits.height + paddingVar.top + paddingVar.bottom
        return CGSize(width: width, height: heigth)
    }
    
    public func centerText(){
        self.centered = true
        self.textAlignment = .center
    }
    
    
    override open func awakeFromNib() {
        self.setupView()
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {

            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: frame.height))
            self.rightView = paddingView
            self.rightViewMode = .always
            self.leftView = paddingView
            self.leftViewMode = .always
        
        self.font =  Fonts.fontRegular(size: textSize)
        if self.centered{
            return
        }
        if Language.currentLanguage().contains(AR) {
            self.textAlignment = .right
        } else {
            self.textAlignment = .left
        }
        
        
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: paddingLeft, bottom: 0, right: paddingRight))
    }
    
//    required public init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: paddingLeft, bottom: 0, right: paddingRight))
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: paddingLeft, bottom: 0, right: paddingRight))
    }
    
    @IBInspectable var placeholderColor: UIColor = UIColor.gray {
        didSet{
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "" ,
                                                            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor ])
        }
    }
    
    @IBInspectable public var boderColor: UIColor = Colors.primaryColor {
        didSet{
            self.layer.borderColor = boderColor.cgColor
        }
    }
    
//    var setFont: UIFont = Fonts.fontSemiBold() {
//        didSet{
//            self.font = setFont
//        }
//    }
    
    @IBInspectable var textSize:CGFloat = UIFont.labelFontSize {
        didSet {
            self.font = Fonts.fontRegular(size: textSize)
        }
        
    }
    
    
    // Dimentions in Dimentions.swift
    
    @IBInspectable var padding: CGFloat = 0 {
        didSet{
            self.paddingVar = UIEdgeInsets(top: padding, left: padding , bottom: padding, right: padding)
        }
    }
    
    @IBInspectable var paddingLeft:CGFloat = 15 {
        didSet{
            self.paddingVar = UIEdgeInsets(top: paddingTop , left: paddingLeft , bottom: paddingBottom , right: paddingRight )
        }
    }
    
    @IBInspectable public var raduisCorner:CGFloat = 5 {
        didSet{
            self.layer.cornerRadius = raduisCorner
            self.layer.borderWidth = 1
            self.layer.borderColor = self.boderColor.cgColor
            self.borderStyle = .none
        }
    }
    
    @IBInspectable var paddingRight:CGFloat = 15 {
        didSet{
            self.paddingVar = UIEdgeInsets(top: paddingTop , left: paddingLeft , bottom: paddingBottom , right: paddingRight )
        }
    }
    
    @IBInspectable var paddingTop:CGFloat = 0 {
        didSet{
            self.paddingVar = UIEdgeInsets(top: paddingTop , left: paddingLeft , bottom: paddingBottom , right: paddingRight )
        }
    }
    
    @IBInspectable var paddingBottom:CGFloat = 0 {
        didSet{
            self.paddingVar = UIEdgeInsets(top: paddingTop , left: paddingLeft , bottom: paddingBottom , right: paddingRight )
        }
    }
    
}
