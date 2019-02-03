
import Foundation
import UIKit

@IBDesignable open class BLabel : UILabel {
    
     var centered = false
    var paddingVar = UIEdgeInsets(top: 0 , left: 0 , bottom: 0 , right: 0 )
    
    override open func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: paddingVar ))
        if !centered{
            self.textAlignment = Language.currentLanguage().contains("ar") ? .right : .left
        }
    }
    
    public func centerText(){
        self.centered = true
        self.textAlignment = .center
    }
    
    override open var intrinsicContentSize: CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + paddingVar.left + paddingVar.right
        let heigth = superContentSize.height + paddingVar.top + paddingVar.bottom
        return CGSize(width: width, height: heigth)
    }
    
    func setUnderline(){
        let attrs = NSAttributedString(string: self.text ?? "",
                                       attributes: [NSAttributedString.Key.font : self.font ?? UIFont.systemFont(ofSize: 17.0), NSAttributedString.Key.foregroundColor : self.textColor,
                                                    NSAttributedString.Key.underlineStyle : 1])
        self.attributedText = attrs
    }
    
    func setupView() {
        self.font =  Fonts.fontSemiBold()
        if Language.currentLanguage().contains(AR) {
            self.textAlignment = .right
        } else {
            self.textAlignment = .left
        }
    }
    
    // Override -sizeThatFits: for Springs & Struts code
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        let superSizeThatFits = super.sizeThatFits(size)
        
        let width = superSizeThatFits.width + paddingVar.left + paddingVar.right
        let heigth = superSizeThatFits.height + paddingVar.top + paddingVar.bottom
        return CGSize(width: width, height: heigth)
    }
    
    
    override open func awakeFromNib() {
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
 
        self.lineBreakMode = NSLineBreakMode.byTruncatingTail
        
        self.adjustsFontForContentSizeCategory = true
        
       
        setupView()
        
    }
    
    @IBInspectable var setFont: Int = 1 {
        didSet{
            if setFont == 0 {
                self.font = Fonts.fontLight(size: textSize)
            }else if setFont == 1 {
                self.font = Fonts.fontRegular(size: textSize)
            }else if setFont == 3  {
                self.font = Fonts.fontSemiBold(size: textSize)
            }else if setFont == 2{
                self.font = Fonts.fontMeduim(size: textSize)
            }else {
                self.font = Fonts.fontRegular(size: textSize)
            }
            self.adjustsFontForContentSizeCategory = true
        }
    }
    
    
    @IBInspectable var textSize:CGFloat = UIFont.labelFontSize {
        didSet {
            if setFont == 0 {
                self.font = Fonts.fontLight(size: textSize)
            }else if setFont == 1 {
                self.font = Fonts.fontRegular(size: textSize)
            }else if setFont == 2 {
                self.font = Fonts.fontMeduim(size: textSize)
            }else if setFont == 3 {
                self.font = Fonts.fontSemiBold(size: textSize)
            }else{
                 self.font = Fonts.fontRegular(size: textSize)
            }
            self.adjustsFontForContentSizeCategory = true
        }
        
    }
    
    
    @IBInspectable var padding: CGFloat = 0 {
        didSet{
            self.paddingVar = UIEdgeInsets(top: padding, left: padding , bottom: padding, right: padding)
        }
    }
    
    @IBInspectable var paddingLeft:CGFloat = 0 {
        didSet{
             self.paddingVar = UIEdgeInsets(top: 0, left: paddingLeft , bottom: 0, right: 0)
        }
    }
    
    @IBInspectable var paddingRight:CGFloat = 0 {
        didSet{
            self.paddingVar = UIEdgeInsets(top: 0, left: 0 , bottom: 0, right: paddingRight )
        }
    }
    
    @IBInspectable var paddingTop:CGFloat = 0 {
        didSet{
            self.paddingVar = UIEdgeInsets(top: paddingTop , left: 0 , bottom: 0, right: 0 )
        }
    }
    
    @IBInspectable var paddingBottom:CGFloat = 0 {
        didSet{
            self.paddingVar = UIEdgeInsets(top: 0, left: 0 , bottom: paddingBottom , right: 0 )
        }
    }
    
    
  
    
    
    
    
    
    
    
}
