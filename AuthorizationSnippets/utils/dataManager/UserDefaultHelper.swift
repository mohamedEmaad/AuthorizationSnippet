//
//  UserDefaultHelper.swift
//  Makfy
//
//  Created by Mohamed Emad on 1/23/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import Foundation

// local data storage
protocol UserDefaultHelper {
//    func saveUserData(userData: UserModel?)
    func setUsername(name: String)
    func getUserId() -> String
    func isUserLogedIn() -> Bool
    func getUserType() -> String
    func getUserImage() -> String
    func getUserEmail() -> String
    func getUsername() -> String
    func getUserPhone() -> String
    func isDeviceLanguageArabic() -> Bool
    func setApplicationType(application: String)
    func getAppliactionType() -> String
    func getToken() -> String
    func getUserBirthDate() -> String
    func signout()
    func tokenActivated(isTokenActivated: Bool)
    func getNotificationActivated() -> Bool
    func setUserType(type: String)
}
