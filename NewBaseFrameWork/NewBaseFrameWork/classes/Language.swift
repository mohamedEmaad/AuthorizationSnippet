//
//  Language.swift
//  Waset
//
//  Created by Ismael AlShabrawy on 4/19/18.
//  Copyright © 2018 Baianat. All rights reserved.
//

import Foundation

open class Language {
    public class func currentLanguage() -> String {
        let def = UserShared.instance.defaults
        let lang = def.object(forKey: "AppleLanguages") as! NSArray
        let firstLang = lang.firstObject as! String
        
        return firstLang
    }
    
    public class func setAppLanguage(lang: String){
        let def = UserShared.instance.defaults
        def.set([lang, currentLanguage()], forKey: "AppleLanguages")
        def.synchronize()
    }
}
