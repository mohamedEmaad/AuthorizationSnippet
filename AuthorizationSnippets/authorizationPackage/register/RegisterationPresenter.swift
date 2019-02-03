//
//  RegisterationPresenter.swift
//  Makfy
//
//  Created by Mohamed Emad on 2/3/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

class RegisterationPresenter {
    
    let disposeBag: DisposeBag
    let viewPresenter: RegisterationViewPresenter
//    private let dataManger: DataManger = (UIApplication.shared.delegate as! AppDelegate).dataManger
    
    init(disposeBag: DisposeBag, viewPresenter: RegisterationViewPresenter) {
        self.disposeBag = disposeBag
        self.viewPresenter = viewPresenter
    }
    
    // check for inputs and register
    func checkForInputsDataAndRegister(username: String, phone: String, password: String, email: String?, userType: UserType){
        self.viewPresenter.showLoading()
//        self.dataManger.register(registerMutation: RegisterNewUserMutation(userInput: UserInput(role: "", type: "\(userType)", name: username, email: email, password: password, phone: phone, fcmToken: "")))
    }
}
