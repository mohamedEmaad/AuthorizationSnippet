//
//  UserDefaultHelperImp.swift
//  Makfy
//
//  Created by Mohamed Emad on 1/23/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import Foundation
import NewBaseFrameWork

class UserDefaultHelperImp: UserDefaultHelper {
    
    private let userDefaults = UserShared.instance
    
//    /**
//     save user data to the local storage
//     */
//    func saveUserData(userData: UserModel?) {
//        userDefaults.userName = userData?.name ?? ""
//        userDefaults.userID = "\(userData?.id ?? 0)"
//        userDefaults.userPhone = userData?.phone ?? ""
//        userDefaults.userEmail = userData?.email ?? ""
//        userDefaults.userImage = userData?.profileImage ?? ""
//        userDefaults.userToken = userData?.token ?? ""
//        userDefaults.userType = userData?.userType ?? ""
//        userDefaults.birthDate = userData?.birthDate ?? ""
//        userDefaults.genderType = userData?.gender ?? ""
//    }
    
    /**
     get user id
     */
    func getUserId() -> String{
        return userDefaults.userID
    }
    
    /**
     check if the user is loged in or not
     */
    func isUserLogedIn() -> Bool{
        return userDefaults.isLoggedIn
    }
    
    /**
     return  user type
     */
    func getUserType() -> String {
        return userDefaults.userType
    }
    
    /**
     return  user image
     */
    func getUserImage() -> String {
        return userDefaults.userImage
    }
    
    /**
     return  user email
     */
    func getUserEmail() -> String {
        return userDefaults.userEmail
    }
    
    /**
     return  user name
     */
    func getUsername() -> String {
        return userDefaults.userName
    }
    
    /**
     return  user phone
     */
    func getUserPhone() -> String {
        return userDefaults.userPhone
    }
    
    func isDeviceLanguageArabic() -> Bool {
        return Language.currentLanguage().contains("ar")
    }
    
    /**
     set the type of the application (Doctor or Patient)
     */
    func setApplicationType(application: String) {
        self.userDefaults.applicationType = application
    }
    
    /**
     get the type of the application if (Doctor or Patient)
     */
    func getAppliactionType() -> String {
        return self.userDefaults.applicationType
    }
    
    /**
     get the token for this user
     */
    func getToken() -> String {
        return self.userDefaults.userToken
    }
    
    /**
     get the birth date of this user
     */
    func getUserBirthDate() -> String {
        return self.userDefaults.birthDate
    }
    
    /**
     handles signout from the app and remove the data
     */
    func signout() {
        self.userDefaults.signout()
    }
    
    /**
     handles the activation of the notification
     */
    func tokenActivated(isTokenActivated: Bool) {
        self.userDefaults.notificationActive = isTokenActivated
    }
    
    /**
     check for the notification activation
     */
    func getNotificationActivated() -> Bool {
        return self.userDefaults.notificationActive
    }
    
    /**
     set user name for temp
     */
    func setUsername(name: String) {
        self.userDefaults.userName = name
    }
    
    /**
     set user type
     */
    func setUserType(type: String) {
        self.userDefaults.userType = type
    }
    
}
