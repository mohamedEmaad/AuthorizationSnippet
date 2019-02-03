//
//  Fonts.swift
//  BaseApp
//
//  Created by Yousef on 10/30/18.
//  Copyright © 2018 Yousef. All rights reserved.
//

import UIKit

enum FontName : String {
    // arabic fonts
    case FONT_SEMI_BOLD_AR = "Changa-SemiBold"
    case FONT_LIGHT_AR = "Changa-Light"
    case FONT_MEDUIM_AR = "Changa-Medium"
    case FONT_REGULAR_AR = "Changa-Regular"
    // english fonts
    case FONT_SEMI_BOLD_EN = "Roboto-Bold"
    case FONT_LIGHT_EN = "Roboto-Light"
    case FONT_MEDUIM_EN = "Roboto-Medium"
    case FONT_REGULAR_EN = "Roboto-Regular"
    
}

open class  Fonts {
    
    static let AR = "ar"
    static let EN = "en"
    
    private static func fontPathLight() -> FontName{
        if Language.currentLanguage().contains(AR){
            return .FONT_LIGHT_AR
        }else if Language.currentLanguage().contains(EN) {
            return .FONT_LIGHT_EN
        }else{
            return .FONT_LIGHT_EN
        }
    }
    
    private static func fontPathRegular() -> FontName{
        if Language.currentLanguage().contains(AR){
            return .FONT_REGULAR_AR
        }else if Language.currentLanguage().contains(EN) {
            return .FONT_REGULAR_EN
        }else{
            return .FONT_REGULAR_EN
        }
    }
    
    private static func fontPathmeduim() -> FontName{
        if Language.currentLanguage().contains(AR){
            return .FONT_MEDUIM_AR
        }else if Language.currentLanguage().contains(EN) {
            return .FONT_MEDUIM_EN
        }else{
            return .FONT_MEDUIM_EN
        }
    }
    
    
    private static func fontPathSemiBold() -> FontName{
        if Language.currentLanguage().contains(AR){
            return .FONT_SEMI_BOLD_AR
        }else if Language.currentLanguage().contains(EN) {
            return .FONT_SEMI_BOLD_EN
        }else{
            return .FONT_SEMI_BOLD_EN
        }
    }
    
    public static func fontLight(size : CGFloat = UIFont.labelFontSize )-> UIFont {
        if let customFont = UIFont(name: fontPathLight().rawValue , size: size  ){
            return UIFontMetrics.default.scaledFont(for: customFont)
        }else{
            return UIFont.systemFont(ofSize: 19.0)
        }
        
    }
    
    public static func fontRegular(size : CGFloat = UIFont.labelFontSize)-> UIFont {
        
        if let customFont = UIFont(name: fontPathRegular().rawValue ,size:  size   ) {
            return UIFontMetrics.default.scaledFont(for: customFont)
        }else{
            return UIFont.systemFont(ofSize: 19.0)
        }
    }
    
    
    public static func fontMeduim(size : CGFloat = UIFont.labelFontSize)-> UIFont {
        if let customFont = UIFont(name: fontPathmeduim().rawValue , size: size ){
            return UIFontMetrics.default.scaledFont(for: customFont)
        }else{
            return UIFont.systemFont(ofSize: 19.0)
        }
        
    }
    
    public static func fontSemiBold(size : CGFloat = UIFont.labelFontSize)-> UIFont {
        if let customFont = UIFont(name: fontPathSemiBold().rawValue , size: size ){
            return UIFontMetrics.default.scaledFont(for: customFont)
        }else{
            return UIFont.systemFont(ofSize: 19.0)
        }
        
    }

}

