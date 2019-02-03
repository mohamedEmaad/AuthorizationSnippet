//
//  LoginPresenter.swift
//  Makfy
//
//  Created by Mohamed Emad on 1/21/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import Foundation
import RxSwift
import NewBaseFrameWork

class LoginPresenter{
    
    let viewPresenter: LoginViewPresenter!
    let disposeBag: DisposeBag!
//    private let dataManger: DataManger = (UIApplication.shared.delegate as! AppDelegate).dataManger
    
    init(viewPresenter: LoginViewPresenter, disposeBag: DisposeBag) {
        self.viewPresenter = viewPresenter
        self.disposeBag = disposeBag
    }
    
    func loginNow(username: String, password: String){
        self.viewPresenter.showLoading()
//        self.getLoginResponse(observable: self.dataManger.login(login: LoginMutation(userInput: UserInput(email: username, password: password))))
    }
    
//    func getLoginResponse(observable: Observable<LoginMutation.Data?>){
//        
//        observable.asObservable().subscribe(onNext: { (reseponse) in
//            self.viewPresenter.hideLoading()
//            
//        }, onError: { (error) in
//            self.viewPresenter.hideLoading()
//            self.viewPresenter.onFailure(message: error.localizedDescription)
//            print("error \(error)")
//        }).disposed(by: self.disposeBag)
//        
//    }
}
