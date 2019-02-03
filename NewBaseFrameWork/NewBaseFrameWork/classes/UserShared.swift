//
//  UserShared.swift
//  farh
//
//  Created by Yousef on 8/26/18.
//  Copyright © 2018 Ismael AlShabrawy. All rights reserved.
//

import Foundation

open class UserShared {
    public static let instance = UserShared()
    let defaults = UserDefaults.standard
    
    public var isFirstTime : Bool { get { return defaults.bool(forKey: FIRST_TIME) } set { defaults.set(newValue, forKey: FIRST_TIME)  } }
    
  
    public var isLoggedIn : Bool {
        get {
            if !userToken.isEmpty && !userID.isEmpty {
                return true
            }else{
                return false
            }
        }
    }
    
    public var userName : String { get { return defaults.string(forKey: USER_NAME_KEY) ?? "" } set { defaults.set(newValue, forKey: USER_NAME_KEY)  } }
    
    public var userEmail : String { get { return defaults.string(forKey: USER_EMAIL_KEY) ?? "" } set { defaults.set(newValue, forKey: USER_EMAIL_KEY)  } }
    
    public var userID : String { get { return defaults.string(forKey: USER_ID_KEY) ?? "" } set { defaults.set(newValue, forKey: USER_ID_KEY)  } }
    
    public var userPhone : String { get { return defaults.string(forKey: USER_PHONE_KEY) ?? "" } set { defaults.set(newValue, forKey: USER_PHONE_KEY)  } }
    
    public var userImage : String { get { return defaults.string(forKey: USER_IMAGE_KEY) ?? "" } set { defaults.set(newValue, forKey: USER_IMAGE_KEY )  } }
    
    public var userToken : String { get { return defaults.string(forKey: USER_TOKEN_KEY) ?? "" } set { defaults.set(newValue, forKey: USER_TOKEN_KEY)  } }
    
    public var userType : String { get { return defaults.string(forKey: USER_TYPE_KEY) ?? "" } set { defaults.set(newValue, forKey: USER_TYPE_KEY)  } }
    
    public var genderType : String { get { return defaults.string(forKey: USER_GENDER_KEY) ?? "" } set { defaults.set(newValue, forKey: USER_GENDER_KEY)  } }
    
    public var birthDate : String { get { return defaults.string(forKey: USER_BIRTH_DATE_KEY) ?? "" } set { defaults.set(newValue, forKey: USER_BIRTH_DATE_KEY)  } }

    public var language : String { get { return defaults.string(forKey: LANGUAGE ) ?? "" } set { defaults.set(newValue, forKey: LANGUAGE)  } }
    
     public var applicationType : String { get { return defaults.string(forKey: APPLICATION_TYPE ) ?? "" } set { defaults.set(newValue, forKey: APPLICATION_TYPE)  } }

     public var notificationActive : Bool { get { return defaults.bool(forKey: NOTIFICATION_ACTIVE) } set { defaults.set(newValue, forKey: NOTIFICATION_ACTIVE)  } }

    public func saveUserDefaults( user_FullName: String, userEmail: String, user_Id: Int, user_Phone: String, user_Roll: String, user_Image: String, user_Token: String){
        
        self.userName = user_FullName
        self.userEmail = userEmail
        self.userID = String(user_Id)
        self.userPhone = user_Phone
        self.userImage = user_Image
        self.userToken = user_Token
        
    }
    
    public func signout() {
        let lang = Language.currentLanguage()
        self.isFirstTime = true
        self.defaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        self.defaults.synchronize()
        self.userToken = ""
        self.language = lang
        Language.setAppLanguage(lang: lang)
    }
}

