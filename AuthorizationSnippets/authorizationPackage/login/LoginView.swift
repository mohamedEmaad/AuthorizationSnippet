//
//  LoginView.swift
//  Makfy
//
//  Created by Mohamed Emad on 1/20/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import NewBaseFrameWork
import SnapKit
import UIKit
import RxSwift
import RxCocoa

class LoginView: UIView {
    
    var disposeBag: DisposeBag!
    var loginClickListener: LoginViewClickListener!
    
    // set the phone number title of the view controller
    lazy var phoneTitle: UILabel = {
        let view = BLabel()
        view.tag = 11
        view.numberOfLines = 0
        view.textColor = Colors.textColor
        view.text = "Phone number"
        view.font = Fonts.fontLight(size: 15)
        
        return view
    }()
    
    // phone text field
    lazy var phoneTextField: BTextField = {
        let view = BTextField()
        view.tag = 12
        view.keyboardType = .phonePad
        view.font = Fonts.fontRegular()
        view.raduisCorner = 20
        view.borderStyle = .none
        view.boderColor = .lightGray
        
        return view
    }()
    
    // phone validation image view
    lazy var phoneValidationView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.7
        imageView.tag = 18
        return imageView
    }()
    
    // set the phone number title of the view controller
    lazy var passwordLabel: UILabel = {
        let view = BLabel()
        view.tag = 13
        view.numberOfLines = 0
        view.text = "Password"
        view.textColor = Colors.textColor
        view.font = Fonts.fontLight(size: 15)
        
        return view
    }()
    
    // phone text field
    lazy var passwordTextField: BTextField = {
        let view = BTextField()
        view.tag = 14
        view.keyboardType = .default
        view.isSecureTextEntry = true
        view.font = Fonts.fontRegular()
        view.raduisCorner = 20
        view.borderStyle = .none
        view.boderColor = .lightGray
        
        return view
    }()
    
    // setup login button view
    lazy var loginButton: BButton = {
        let button = BButton()
        button.tag = 15
        button.setFont = 2
        button.setTitle("login", for: .normal)
        button.setCornerRaduis(raduis: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundcolor = Colors.primaryColor
        button.setCornerRaduis(raduis: 20)
        
        return button
    }()
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .white)
        return spinner
    }()
    
    // set the phone number forget password label
    lazy var forgetPasswordLabel: UILabel = {
        let view = BLabel()
        view.tag = 16
        view.numberOfLines = 0
        view.textColor = Colors.textColor
        view.text = "Forget password"
        view.font = Fonts.fontLight(size: 15)
        
        return view
    }()
    
    // set the phone number register label
    lazy var registerLabel: UILabel = {
        let view = BLabel()
        view.tag = 17
        view.numberOfLines = 0
        view.font = Fonts.fontLight(size: 15)
        view.centerText()
        
        // set string text to this label
        let attrs1 = [NSAttributedString.Key.font : Fonts.fontRegular(size: 16), NSAttributedString.Key.foregroundColor : Colors.textColor]
        let attrs2 = [NSAttributedString.Key.font : Fonts.fontSemiBold(size: 16), NSAttributedString.Key.foregroundColor : Colors.primaryColor]
        let attributedString1 = NSMutableAttributedString(string:"Do not have an account?, ", attributes:attrs1)
        let attributedString2 = NSMutableAttributedString(string:"Sign up.", attributes:attrs2)
        
        attributedString1.append(attributedString2)
        view.attributedText = attributedString1
        
        return view
    }()
 
    init(disposeBag: DisposeBag, loginClickListener: LoginViewClickListener) {
        self.init()
        self.disposeBag = disposeBag
        self.loginClickListener = loginClickListener
        self.viewsClickListeners()
        self.checkForViewInputs()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addViewAndSetConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // add item views and set the constraints
    func addViewAndSetConstraints(){
        
        self.addSubview(self.phoneTitle)
        self.addSubview(self.phoneTextField)
        self.addSubview(self.phoneValidationView)
        self.addSubview(self.passwordLabel)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.forgetPasswordLabel)
        self.addSubview(self.registerLabel)
        
        // set constraints for the phone Title
        phoneTitle.snp.makeConstraints({ [unowned self] (make) in
            make.leading.equalTo(self).offset(Dimensions.extraMeduimMargin)
            make.top.equalTo(self).offset(Dimensions.extraLargeMargin + 10)
        })
        
        // set constraints for the phone TextField
        phoneTextField.snp.makeConstraints({ [unowned self] (make) in
            make.top.equalTo(self.phoneTitle.snp.bottom).offset(2)
            make.leading.equalTo(self).offset(Dimensions.meduimMargin)
            make.trailing.equalTo(self).offset(-Dimensions.meduimMargin)
            make.height.equalTo(40)
        })
        
        // set the constraints for the phone
        phoneValidationView.snp.makeConstraints { (make) in
            make.width.height.equalTo(40)
            make.trailing.equalTo(phoneTextField.snp.trailing).offset(-4)
            make.centerY.equalTo(phoneTextField)
        }
        
        // set constraints for the password Title
        passwordLabel.snp.makeConstraints({ [unowned self] (make) in
            make.leading.equalTo(phoneTitle.snp.leading)
            make.top.equalTo(self.phoneTextField.snp.bottom).offset(Dimensions.extraMeduimMargin)
        })
        
        // set constraints for the password TextField
        passwordTextField.snp.makeConstraints({ [unowned self] (make) in
            make.top.equalTo(self.passwordLabel.snp.bottom).offset(2)
            make.leading.trailing.equalTo(phoneTextField)
            make.height.equalTo(40)
        })
        
        // set the constraints for login button
        loginButton.snp.makeConstraints({ (make) in
            make.height.equalTo(40)
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(Dimensions.extraLargeMargin)
            make.leading.trailing.equalTo(passwordTextField)
        })
        
        // set the constraints for forget password label
        forgetPasswordLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(loginButton.snp.bottom).offset(2)
            make.trailing.equalTo(loginButton).offset(-Dimensions.smallMargin)
        })
        
        // set the constraints for sign up label
        registerLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(forgetPasswordLabel.snp.bottom).offset(Dimensions.extraLargeMargin)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(self.snp.bottom).offset(-Dimensions.largeMargin)
        })
    
        loginButton.isEnabled = false
    }
    
    // handles click listener for this view
    func viewsClickListeners(){
        // set click for phone icon
        let phoneTapGesture = UITapGestureRecognizer()
        phoneValidationView.addGestureRecognizer(phoneTapGesture)
        
        // listen for any click happens for the phone or password image view
        phoneTapGesture.rx.event.bind(onNext: {[unowned self] (recognizer) in
            self.loginClickListener.onViewValidationViewClickListener(selectedViewFrame: self.phoneValidationView.frame, text: "Invalid phone number ")
        }).disposed(by: self.disposeBag)
        
        // handles login click action
        self.loginButton.rx.tap.bind(onNext: {[unowned self] (recognizer) in
            self.loginClickListener.onLoginButtonClick(username: self.phoneTextField.text ?? "", password: self.passwordTextField.text ?? "")
        }).disposed(by: self.disposeBag)
        
        // handle setting and clicking on register label
        self.registerLabel.isUserInteractionEnabled = true
        let registerClickGesture = UITapGestureRecognizer()
        self.registerLabel.addGestureRecognizer(registerClickGesture)
        registerClickGesture.rx.event.bind(onNext: { [weak self] (recognizer) in
            self?.loginClickListener.onRegisterLabelClicked()
        }).disposed(by: self.disposeBag)
        
    }
    
    // handles checking for input of the view
    func checkForViewInputs(){
        
        // observable for phone validation
        let phoneValidator = TextValidator(input: self
            .phoneTextField
            .rx
            .text
            .orEmpty
            .filter{!($0.isEmpty)}
            .throttle(0.2, scheduler: MainScheduler.instance)
            .asObservable(), regex: .phoneNo )
        
        // observable for password validation
        let passwordValidator = TextValidator(input: self
            .passwordTextField
            .rx
            .text
            .orEmpty
            .throttle(0.2, scheduler: MainScheduler.instance)
            .asObservable(), regex: .password)
        
        // validate the phone and the password
        Observable.combineLatest(phoneValidator.validate(), passwordValidator.validate(),
                                 resultSelector: { [unowned self] phoneValidation, passwordValidation  -> Bool in
                                    let phoneValidationImageView = self.phoneValidationView
                                    phoneValidationImageView.changeImageWithAnimation(selectedImage: phoneValidation ? #imageLiteral(resourceName: "validationRightView").imageWithInsets(insetDimen: 14) : #imageLiteral(resourceName: "validationErrorView").imageWithInsets(insetDimen: 14))
                                    phoneValidationImageView.isUserInteractionEnabled = !phoneValidation
                                    self.loginClickListener.hidePopView()
                                    return phoneValidation && passwordValidation
        })
            .bind(to: self.loginButton.rx.isEnabled)
            .disposed(by: self.disposeBag)
    }
    
    // show the loading
    func showLoading(){
        self.addSubview(self.loadingIndicator)
        self.loadingIndicator.snp.makeConstraints { (make) in
            make.center.equalTo(self.loginButton)
        }
        self.loadingIndicator.startAnimating()
        self.loginButton.setTitleWithAnimation(text: "")
        self.isUserInteractionEnabled = false
    }
    
    // hide the loading while processing the data
    func hideLoading(){
        self.loadingIndicator.stopAnimating()
        self.loadingIndicator.removeFromSuperview()
        self.loginButton.setTitleWithAnimation(text: "Login")
        self.isUserInteractionEnabled = true
    }
    
}
