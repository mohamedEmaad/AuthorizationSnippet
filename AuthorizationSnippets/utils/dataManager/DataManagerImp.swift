//
//  DataManagerImp.swift
//  Makfy
//
//  Created by Mohamed Emad on 1/23/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import Foundation

import Foundation
import RxSwift
//import Alamofire

class DataManagerImp: DataManger {

    let apiHelper: ApiHelper
    let userDefaultsHelper: UserDefaultHelper
    
    init(apiHelper: ApiHelper, userDefaultsHelper: UserDefaultHelper) {
        self.apiHelper = apiHelper
        self.userDefaultsHelper = userDefaultsHelper
    }
    
    func setUsername(name: String) {
        self.userDefaultsHelper.setUsername(name: name)
    }
    
    func getUserId() -> String {
        return self.userDefaultsHelper.getUserId()
    }
    
    func isUserLogedIn() -> Bool {
       return self.userDefaultsHelper.isUserLogedIn()
    }
    
    func getUserType() -> String {
      return  self.userDefaultsHelper.getUserType()
    }
    
    func getUserImage() -> String {
        return self.userDefaultsHelper.getUserImage()
    }
    
    func getUserEmail() -> String {
        return self.userDefaultsHelper.getUserEmail()
    }
    
    func getUsername() -> String {
        return self.userDefaultsHelper.getUsername()
    }
    
    func getUserPhone() -> String {
        return self.userDefaultsHelper.getUserPhone()
    }
    
    func isDeviceLanguageArabic() -> Bool {
        return self.userDefaultsHelper.isDeviceLanguageArabic()
    }
    
    func setApplicationType(application: String) {
        self.userDefaultsHelper.setApplicationType(application: application)
    }
    
    func getAppliactionType() -> String {
        return self.userDefaultsHelper.getAppliactionType()
    }
    
    func getToken() -> String {
        return self.userDefaultsHelper.getToken()
    }
    
    func getUserBirthDate() -> String {
        return self.userDefaultsHelper.getUserBirthDate()
    }
    
    func signout() {
        self.userDefaultsHelper.signout()
    }
    
    func tokenActivated(isTokenActivated: Bool) {
        self.userDefaultsHelper.tokenActivated(isTokenActivated: isTokenActivated)
    }
    
    func getNotificationActivated() -> Bool {
        return self.userDefaultsHelper.getNotificationActivated()
    }
    
    func setUserType(type: String) {
        return self.userDefaultsHelper.setUserType(type: type)
    }
    
    
    // --------------------------------------------------------------------------------------------------------------------------------
    // api calls
    
//    func login(login: LoginMutation) -> Observable<LoginMutation.Data?> {
//        return self.apiHelper.login(login: login)
//    }
//    
//    func register(registerMutation: RegisterNewUserMutation) -> Observable<RegisterNewUserMutation.Data?> {
//        return self.apiHelper.register(registerMutation: registerMutation)
//    }
}
