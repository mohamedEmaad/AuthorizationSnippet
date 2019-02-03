//
//  LoginViewController.swift
//  Makfy
//
//  Created by Mohamed Emad on 1/20/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import UIKit
import SnapKit
import NewBaseFrameWork
import RxCocoa
import RxSwift

class LoginViewController: ParentViewController {
    
    // set the content view of the login view
    lazy var scrollContentView = LoginView(disposeBag: self.disposeBag, loginClickListener: self)
    
    // init the dispose bag for the subscribers
    let disposeBag = DisposeBag()
    private lazy var popupLayout = PopLayoutView()
    private lazy var presenter = LoginPresenter(viewPresenter: self, disposeBag: self.disposeBag)
    private lazy var registerViewController = RegisterationViewController.getObject()
    
    // return the scroll view
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        self.view.addSubview(view)
        view.snp.makeConstraints({ (make) in
            if #available(iOS 11.0, *){
                make.edges.equalTo(self.view.safeAreaLayoutGuide)
            }else{
                make.left.right.equalToSuperview()
                make.top.equalTo(self.topLayoutGuide.snp.bottom)
                make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
            }
        })
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.makeUIView()
    }
    
    // set the content view of the scrollview
    func makeUIView(){
        self.view.backgroundColor = Colors.backgroundColor
        self.scrollContentView.backgroundColor = .clear
        self.scrollView.addSubview(scrollContentView)
        scrollContentView.snp.makeConstraints({ (make) in
            make.top.bottom.leading.trailing.equalTo(scrollView)
            make.width.equalTo(view)
            })
        
        self.hideBackTitle() // hide the back title while navigating
        self.navigationController?.setNavigationControllerTintToBlack(color: Colors.textColor)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Login"
    }
    
}

extension LoginViewController: LoginViewPresenter{
    func showLoading() {
        self.scrollContentView.showLoading()
    }
    
    func hideLoading() {
        self.scrollContentView.hideLoading()
    }
    
    func onError(message: String) {
        self.showSnackBar(text: message, bottomMargin: -30, snackBarStatus: .error)
    }
    
    func onFailure(message: String) {
        self.onError(message: message)
    }
    
}

extension LoginViewController: LoginViewClickListener{
    func onRegisterLabelClicked() {
        self.navigationController?.pushViewController(self.registerViewController, animated: true)
    }
    
    func hidePopView() {
        self.popupLayout.hidePop()
    }
    
    func onLoginButtonClick(username: String, password: String) {
        self.endEditing()
        self.presenter.loginNow(username: username, password: password)
    }
    
    func onViewValidationViewClickListener(selectedViewFrame: CGRect, text: String) {
            self.popupLayout.showPopTip(text: text, color: Colors.errorColor, view: self.scrollContentView, direction: .down, selectedViewFrame: selectedViewFrame, clickDismiss: true)
    }
    
}

protocol LoginViewClickListener: PopViewListener {
    func onLoginButtonClick(username: String, password: String)
    func onRegisterLabelClicked()
}

protocol PopViewListener {
    func onViewValidationViewClickListener(selectedViewFrame: CGRect, text: String)
    func hidePopView()
}
