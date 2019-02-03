//
//  BTextView.swift
//  farh
//
//  Created by Yousef on 9/29/18.
//  Copyright © 2018 Ismael AlShabrawy. All rights reserved.
//

import Foundation
import UIKit

open class BTextView : UITextView, UITextViewDelegate {
    
    var paddingVar = UIEdgeInsets(top: 0 , left: 0 , bottom: 0 , right: 0 )
    
    override open func draw(_ rect: CGRect) {
        super.draw( rect.inset(by: paddingVar ) )
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
    
    
    func setupView() {
        delegate = self
        self.font =  Fonts.fontSemiBold()
        if Language.currentLanguage().contains(AR) {
            self.textAlignment = .right
        } else {
            self.textAlignment = .left
        }
        
        if !Placeholder.isEmpty {
            text = Placeholder
            textColor = UIColor.lightGray
        }
    }
    
    var isEmpty : Bool {
        if text == Placeholder || text.isEmpty {
            return true
        }else{
            return false
        }
        
    }
    
    override open func awakeFromNib() {
        self.setupView()
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
        
    }

    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var setFont: UIFont = Fonts.fontSemiBold() {
        didSet{
            self.font = setFont
        }
    }
    
    @IBInspectable var textSize:CGFloat = UIFont.labelFontSize {
        didSet {
            
            if setFont == Fonts.fontSemiBold() {
                self.font = Fonts.fontSemiBold(size: textSize)
            }else {
            }
        }
    }
    
    @IBInspectable var padding: CGFloat = 0 {
        didSet{
            self.paddingVar = UIEdgeInsets(top: padding, left: padding , bottom: padding, right: padding)
        }
    }
    
    @IBInspectable var paddingLeft:CGFloat = 0 {
        didSet{
            self.paddingVar = UIEdgeInsets(top: paddingTop , left: paddingLeft , bottom: paddingBottom , right: paddingRight )
        }
    }
    
    @IBInspectable var paddingRight:CGFloat = 0 {
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
    
    @IBInspectable var Placeholder : String = "Placeholder"{
        didSet {
            self.textColor = UIColor.lightGray
            self.text = Placeholder
        }
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if self.textColor == UIColor.lightGray {
            self.text = nil
            self.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if self.text.isEmpty {
            self.text = Placeholder
            self.textColor = UIColor.lightGray
        }
    }
    
}
