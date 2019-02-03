//
//  RegisterView.swift
//  Makfy
//
//  Created by Mohamed Emad on 2/2/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import Foundation
import UIKit
import NewBaseFrameWork
import SnapKit
import RxSwift
import RxCocoa

class RegisterView: UIView{
    
    var disposeBag: DisposeBag!
    var clickListener: RegisterViewClickListener!
    var selectedUserType: UserType? = nil
    
    // set username label
    lazy var usernameLabel: BLabel = {
        let view = BLabel()
        view.tag = 21
        view.numberOfLines = 1
        view.textColor = Colors.textColor
        view.text = "Username"
        view.font = Fonts.fontLight(size: 15)
        
        return view
    }()
    
    // set username textfield view
    lazy var usernameTextField: BTextField = {
        let view = BTextField()
        view.tag = 22
        view.keyboardType = .default
        view.font = Fonts.fontRegular()
        view.raduisCorner = 20
        view.borderStyle = .none
        view.boderColor = .lightGray
        
        return view
    }()
    
    // phone validation image view
    lazy var usernameValidationView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.7
        imageView.tag = 32
        return imageView
    }()
    
    // set the phone number title of the view controller
    lazy var phoneTitle: UILabel = {
        let view = BLabel()
        view.tag = 23
        view.numberOfLines = 0
        view.textColor = Colors.textColor
        view.text = "Phone number"
        view.font = Fonts.fontLight(size: 15)
        
        return view
    }()
    
    // phone text field
    lazy var phoneTextField: BTextField = {
        let view = BTextField()
        view.tag = 24
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
        imageView.tag = 29
        return imageView
    }()
    
    // set the phone number title of the view controller
    lazy var passwordLabel: UILabel = {
        let view = BLabel()
        view.tag = 25
        view.numberOfLines = 0
        view.text = "Password"
        view.textColor = Colors.textColor
        view.font = Fonts.fontLight(size: 15)
        
        return view
    }()
    
    // phone text field
    lazy var passwordTextField: BTextField = {
        let view = BTextField()
        view.tag = 26
        view.keyboardType = .default
        view.isSecureTextEntry = true
        view.font = Fonts.fontRegular()
        view.raduisCorner = 20
        view.borderStyle = .none
        view.boderColor = .lightGray
        
        return view
    }()
    
    // set email label view
    lazy var emailLabel: BLabel = {
        let view = BLabel()
        view.tag = 27
        view.numberOfLines = 1
        view.text = "Email"
        view.textColor = Colors.textColor
        view.font = Fonts.fontLight(size: 15)
        
        return view
    }()
    
    // set email text field view
    lazy var emailTextField: BTextField = {
        let view = BTextField()
        view.tag = 28
        view.keyboardType = .emailAddress
        view.font = Fonts.fontRegular()
        view.raduisCorner = 20
        view.borderStyle = .none
        view.boderColor = .lightGray
        
        return view
    }()
    
    // set the shoper view
    lazy var shoperView: UserTypeView = {
        let view = UserTypeView(image: #imageLiteral(resourceName: "userIcon"), text: "Shopper")
    
        return view
    }()
    
    // set the courier view
    lazy var courier: UserTypeView = {
        let view = UserTypeView(image: #imageLiteral(resourceName: "courierIcon"), text: "Courier")
        
        return view
    }()
    
    // set the productive family view
    lazy var productiveFamily: UserTypeView = {
        let view = UserTypeView(image: #imageLiteral(resourceName: "familyIcon"), text: "Productive Family")
        
        return view
    }()
    
    // set the stack view
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.pinBackground(self.stackViewBackgroundView)
        view.axis = NSLayoutConstraint.Axis.horizontal
        view.distribution = UIStackView.Distribution.fillEqually
        view.alignment = UIStackView.Alignment.center
        view.spacing = CGFloat(Dimensions.meduimMargin)
        
        view.addArrangedSubview(self.shoperView)
        view.addArrangedSubview(self.courier)
        view.addArrangedSubview(self.productiveFamily)
        
        return view
    }()
    
    private lazy var stackViewBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10.0
        view.clipsToBounds = true
        return view
    }()
    
    // setup register button view
    lazy var registerButton: BButton = {
        let button = BButton()
        button.tag = 30
        button.setFont = 2
        button.setTitle("Register", for: .normal)
        button.setCornerRaduis(raduis: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundcolor = Colors.primaryColor
        button.setCornerRaduis(raduis: 20)
        button.isEnabled = false
        
        return button
    }()
    
    // set the login label view
    lazy var loginLabel: BLabel = {
        let view = BLabel()
        view.tag = 31
        view.numberOfLines = 1
        
        // set string text to this label
        let attrs1 = [NSAttributedString.Key.font : Fonts.fontRegular(size: 16), NSAttributedString.Key.foregroundColor : Colors.textColor]
        let attrs2 = [NSAttributedString.Key.font : Fonts.fontSemiBold(size: 16), NSAttributedString.Key.foregroundColor : Colors.primaryColor]
        let attributedString1 = NSMutableAttributedString(string:"Already have an account, ", attributes:attrs1)
        let attributedString2 = NSMutableAttributedString(string:"Login.", attributes:attrs2)
        
        attributedString1.append(attributedString2)
        view.attributedText = attributedString1
    
        return view
    }()
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .white)
        return spinner
    }()
    
    init(disposeBag: DisposeBag, registerClickListener: RegisterViewClickListener) {
        self.init()
        self.disposeBag = disposeBag
        self.clickListener = registerClickListener
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
        self.addSubview(self.usernameLabel)
        self.addSubview(self.usernameTextField)
        self.addSubview(self.usernameValidationView)
        self.addSubview(self.phoneTitle)
        self.addSubview(self.phoneTextField)
        self.addSubview(self.phoneValidationView)
        self.addSubview(self.passwordLabel)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.emailLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.stackView)
        self.addSubview(self.registerButton)
        self.addSubview(self.loginLabel)
        
        // set constraints for the username label
        usernameLabel.snp.makeConstraints { [unowned self](make) in
            make.top.equalTo(self).offset(Dimensions.extraLargeMargin + 10)
            make.leading.equalTo(self).offset(Dimensions.extraMeduimMargin)
        }
        
        // set constraints for username textfield
        usernameTextField.snp.makeConstraints { [unowned self](make) in
            make.top.equalTo(self.usernameLabel.snp.bottom).offset(2)
            make.leading.equalTo(self).offset(Dimensions.meduimMargin)
            make.trailing.equalTo(self).offset(-Dimensions.meduimMargin)
            make.height.equalTo(40)
        }
        
        // set the constraints for the username validation view
        usernameValidationView.snp.makeConstraints { [unowned self] (make) in
            make.height.width.equalTo(40)
            make.centerY.equalTo(self.usernameTextField)
            make.trailing.equalTo(self.usernameTextField.snp.trailing).offset(-4)
        }
        
        // set constraints for the phone Title
        phoneTitle.snp.makeConstraints({ [unowned self] (make) in
            make.leading.equalTo(self).offset(Dimensions.extraMeduimMargin)
            make.top.equalTo(self.usernameTextField.snp.bottom).offset(Dimensions.extraMeduimMargin)
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
        
        // set the constraints for the email label
        emailLabel.snp.makeConstraints { [unowned self](make) in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(Dimensions.extraMeduimMargin)
            make.leading.equalTo(self.passwordLabel.snp.leading)
        }
        
        // set the constraints for the email text field
        emailTextField.snp.makeConstraints { [unowned self](make) in
            make.top.equalTo(self.emailLabel.snp.bottom).offset(2)
            make.leading.trailing.height.equalTo(self.passwordTextField)
        }
        
        // set the constraint for the stack view
        stackView.snp.makeConstraints { [unowned self] (make) in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(Dimensions.meduimMargin)
            make.leading.trailing.equalTo(self.emailTextField)
        }
        
        // set constraints for the register button
        registerButton.snp.makeConstraints { [unowned self](make) in
            make.top.equalTo(self.stackView.snp.bottom).offset(Dimensions.extraLargeMargin)
            make.leading.trailing.height.equalTo(self.emailTextField)
        }
        
        // set constraints for the login label
        loginLabel.snp.makeConstraints { [unowned self](make) in
            make.top.equalTo(self.registerButton.snp.bottom).offset(50)
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).offset(-Dimensions.extraLargeMargin)
        }
        
    }
    
    // set initi for views
    func setInitViews(){
        self.selectedUserType == nil ? self.shoperView.setSelected() : nil
    }
    
    // handles click listener for this view
    func viewsClickListeners(){
        
        // set click for phone icon
        self.usernameValidationView.isUserInteractionEnabled = true
        let usernameTapGesture = UITapGestureRecognizer()
        usernameValidationView.addGestureRecognizer(usernameTapGesture)
        
        // listen for any click happens for the phone or password image view
        usernameTapGesture.rx.event.bind(onNext: {[unowned self] (recognizer) in
            self.clickListener.onViewValidationViewClickListener(selectedViewFrame: self.usernameValidationView.frame, text: "invalid username")
        }).disposed(by: self.disposeBag)
        
        // set click for phone icon
        self.phoneValidationView.isUserInteractionEnabled = true
        let phoneTapGesture = UITapGestureRecognizer()
        phoneValidationView.addGestureRecognizer(phoneTapGesture)
        
        // listen for any click happens for the phone or password image view
        phoneTapGesture.rx.event.bind(onNext: {[unowned self] (recognizer) in
            self.clickListener.onViewValidationViewClickListener(selectedViewFrame: self.phoneValidationView.frame, text: "invalid phone number")
        }).disposed(by: self.disposeBag)
        
        // set gesture for shoper view
        self.shoperView.isUserInteractionEnabled = true
        let shoperGesture = UITapGestureRecognizer()
        self.shoperView.addGestureRecognizer(shoperGesture)
        
        // handles clicking on shoper view
        shoperGesture.rx.event.bind(onNext: { (recognizer) in
            self.shoperView.setSelected()
            self.productiveFamily.setDeSelected()
            self.courier.setDeSelected()
            self.selectedUserType = .shoper
        }).disposed(by: self.disposeBag)
        
        // set gesture and click for courier view
        self.courier.isUserInteractionEnabled = true
        let courierGesture = UITapGestureRecognizer()
        self.courier.addGestureRecognizer(courierGesture)
        
        // handles click on courier view
        courierGesture.rx.event.bind(onNext: { (recognizer) in
            self.courier.setSelected()
            self.productiveFamily.setDeSelected()
            self.shoperView.setDeSelected()
            self.selectedUserType = .courier
        }).disposed(by: self.disposeBag)
        
        // set gesture and click for productive family view
        self.productiveFamily.isUserInteractionEnabled = true
        let familyGesture = UITapGestureRecognizer()
        self.productiveFamily.addGestureRecognizer(familyGesture)
        
        // handles clicking on productive family view
        familyGesture.rx.event.bind(onNext: { (recognizer) in
            self.productiveFamily.setSelected()
            self.shoperView.setDeSelected()
            self.courier.setDeSelected()
            self.selectedUserType = .productiveFamily
        }).disposed(by: self.disposeBag)
        
        // set the tap gesture for login label
        self.loginLabel.isUserInteractionEnabled = true
        let loginGesture = UITapGestureRecognizer()
        self.loginLabel.addGestureRecognizer(loginGesture)
        
        // listen for any click happens to login label
        loginGesture.rx.event.bind(onNext: { [unowned self](recognizer) in
            self.clickListener.onLoginClicked()
        }).disposed(by: self.disposeBag)
        
        // handles register clicking
        self.registerButton.rx.tap.bind(onNext: { [unowned self] (recognizer) in
            self.clickListener.onRegisterButtonClick(username: self.usernameTextField.text ?? "", phone: self.phoneTextField.text ?? "", password: self.passwordTextField.text ?? "", email: (self.emailTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) ? nil : self.emailTextField.text, userType: self.selectedUserType ?? .shoper)
        }).disposed(by: self.disposeBag)
    }
    
    // handles checking for input of the view
    func checkForViewInputs(){
        
        // check for the username
        let usernameValidator = TextValidator(input: self
            .usernameTextField
            .rx
            .text
            .orEmpty
            .throttle(0.2, scheduler: MainScheduler.instance)
            .asObservable()
            , regex: .alphabeticStringWithSpace)
        
        // check for the phone number if is valid or not
        let phoneNumberValidator = TextValidator(input: self
            .phoneTextField
            .rx
            .text
            .orEmpty
            .throttle(0.2, scheduler: MainScheduler.instance)
            .asObservable(), regex: .phoneNo)
        
        // check for the password whether is valid or not
        let passwordValidator = TextValidator(input: self
            .passwordTextField
            .rx
            .text
            .orEmpty
            .throttle(0.2, scheduler: MainScheduler.instance)
            .asObservable()
            , regex: .password)
        
        // check for the input whether is valid or not
        Observable.combineLatest(usernameValidator.validate(), phoneNumberValidator.validate(), passwordValidator.validate(), resultSelector: { [unowned self] username, phoneNo, password -> Bool in
            self.clickListener.hidePopView()
            
            self.phoneValidationView.changeImageWithAnimation(selectedImage: phoneNo ? #imageLiteral(resourceName: "validationRightView").imageWithInsets(insetDimen: 14) : #imageLiteral(resourceName: "validationErrorView").imageWithInsets(insetDimen: 14))
            self.phoneValidationView.isUserInteractionEnabled = !phoneNo
            
            self.usernameValidationView.changeImageWithAnimation(selectedImage: username ? #imageLiteral(resourceName: "validationRightView").imageWithInsets(insetDimen: 14) : #imageLiteral(resourceName: "validationErrorView").imageWithInsets(insetDimen: 14))
            self.usernameValidationView.isUserInteractionEnabled = !username
            
            return username && phoneNo && password
        }).bind(to: self.registerButton.rx.isEnabled)
            .disposed(by: self.disposeBag)
    }
    
    // show the loading
    func showLoading(){
        self.addSubview(self.loadingIndicator)
        self.loadingIndicator.snp.makeConstraints { (make) in
            make.center.equalTo(self.registerButton)
        }
        self.loadingIndicator.startAnimating()
        self.registerButton.setTitleWithAnimation(text: "")
        self.isUserInteractionEnabled = false
    }
    
    // hide the loading while processing the data
    func hideLoading(){
        self.loadingIndicator.stopAnimating()
        self.loadingIndicator.removeFromSuperview()
        self.registerButton.setTitleWithAnimation(text: "Register")
        self.isUserInteractionEnabled = true
    }
    
}
