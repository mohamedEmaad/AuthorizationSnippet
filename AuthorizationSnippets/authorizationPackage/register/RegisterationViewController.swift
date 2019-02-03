//
//  RegisterationViewController.swift
//  Makfy
//
//  Created by Mohamed Emad on 2/2/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import UIKit
import SnapKit
import NewBaseFrameWork
import RxCocoa
import RxSwift


class RegisterationViewController: ParentViewController {
    
    // set the content view of the register view
    lazy var scrollContentView = RegisterView(disposeBag: self.disposeBag, registerClickListener: self)
    
    // init the dispose bag for the subscribers
    let disposeBag = DisposeBag()

    private lazy var popupLayout = PopLayoutView()
    private lazy var presenter = RegisterationPresenter(disposeBag: self.disposeBag, viewPresenter: self)
    
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
    
    // show the ui to the user
    func makeUIView(){
        self.view.backgroundColor = Colors.backgroundColor
        self.scrollContentView.backgroundColor = .clear
        self.scrollView.addSubview(scrollContentView)
        scrollContentView.snp.makeConstraints({ (make) in
            make.top.bottom.leading.trailing.equalTo(scrollView)
            make.width.equalTo(view)
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Register"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.scrollContentView.setInitViews()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.hideLoading()
    }

    class func getObject() -> RegisterationViewController{
        return self.create(viewControllerId: "RegisterationViewController", storyBoardId: "Main") as! RegisterationViewController
    }
    
}

extension RegisterationViewController: RegisterViewClickListener{
    
    func onViewValidationViewClickListener(selectedViewFrame: CGRect, text: String) {
        self.popupLayout.showPopTip(text: text, color: Colors.errorColor, view: self.scrollContentView, direction: .down, selectedViewFrame: selectedViewFrame, clickDismiss: true)
    }
    
    func hidePopView() {
        self.popupLayout.hidePop()
    }
    
    func onRegisterButtonClick(username: String, phone: String, password: String, email: String?, userType: UserType) {
        self.presenter.checkForInputsDataAndRegister(username: username, phone: phone, password: password, email: email, userType: userType)
    }
    
    func onLoginClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension RegisterationViewController: RegisterationViewPresenter{
    func done() {
        self.showSnackBar(text: "Register is successfully done", bottomMargin: -30, snackBarStatus: .success)
    }
    
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

protocol RegisterViewClickListener: PopViewListener {
    func onRegisterButtonClick(username: String, phone: String, password: String, email: String?, userType: UserType)
    func onLoginClicked()
}

enum UserType{
    case shoper
    case courier
    case productiveFamily
}
