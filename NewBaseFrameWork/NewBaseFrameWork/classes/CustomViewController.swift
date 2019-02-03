//
//  CustomViewController.swift
//  BaseApp
//
//  Created by Yousef on 10/30/18.
//  Copyright © 2018 Yousef. All rights reserved.
//

import UIKit

open class ParentViewController : UIViewController {

    let parentView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    /// if the child wanna hide the keyboard
    open func endEditing(){
        view?.endEditing(true)
    }
    
    var snackBarSeconds = 3
    
    private let snackBarView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.primaryColor
        view.layer.cornerRadius = 10
        
        let textLabel = BLabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.tag = 5002
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.numberOfLines = 0
        textLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textLabel.textSize = 16
        textLabel.setFont = 2
        
        let indicatorView = UIActivityIndicatorView()
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.tag = 5003
        indicatorView.isHidden = true
        
        view.addSubview(textLabel)
        view.addSubview(indicatorView)
        
        // add constraints for text label
        textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        // add constraints for indicator
        indicatorView.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor).isActive = true
        indicatorView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        indicatorView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        indicatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        return view
    }()
    
    private var timer: Timer? = nil
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
//         NotificationCenter.default.addObserver(self, selector: #selector(statusManager), name: .flagsChanged, object: Network.reachability)
        
    }
    
//    @objc func statusManager(_ notification: Notification) {
//        guard let status = Network.reachability?.status else { return }
//        switch status {
//        case .unreachable:
//            unreachableNetWork()
//            break
//        default:
//            print("defualt")
//        }
//    }
    
    open func showLoginView(image: UIImage, imageTopMargin: CGFloat, imageSize: CGFloat = 60, imageHeight: CGFloat = 67 ,imageAlpha: CGFloat = 1, text: String, textColor: UIColor = .black, textSize: CGFloat = 20, subText: String, showButton: Bool = true, buttonText: String = "", buttonTextColor: UIColor = .white, buttonBackgroundColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), buttonWidth: CGFloat = 0 ,viewBackgroundColor: UIColor, view: UIView){
        
        if self.parentView.superview != nil{
            self.updateParentViewWithNewData(image: image, imageTopMargin: imageTopMargin, imageSize: imageSize, imageHeight: imageHeight, imageAlpha: imageAlpha, text: text, textColor: textColor, textSize: textSize, subText: subText, showButton: showButton, buttonText: buttonText, buttonTextColor: buttonTextColor, buttonBackgroundColor: buttonBackgroundColor, buttonWidth: buttonWidth, viewBackgroundColor: viewBackgroundColor)
            return
        }
        
        // add parent view to this view
        view.addSubview(parentView)
        parentView.alpha = 0
        parentView.backgroundColor = viewBackgroundColor
        parentView.translatesAutoresizingMaskIntoConstraints = false
        parentView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        parentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        parentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        parentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        parentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        UIView.animate(withDuration: 0.4) {
            self.parentView.alpha = 1
        }
        
        
        // add empty page to this view
        let emptyImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 170))
        parentView.addSubview(emptyImageView)
        emptyImageView.translatesAutoresizingMaskIntoConstraints = false
        emptyImageView.contentMode = .scaleAspectFill
        emptyImageView.tag = 88980
        emptyImageView.topAnchor.constraint(equalTo: parentView.topAnchor, constant: imageTopMargin).isActive = true
        emptyImageView.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        emptyImageView.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        emptyImageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        emptyImageView.image = image
        emptyImageView.alpha = imageAlpha
        
        // add supter text label to this view
        let superTextLabel = BLabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        parentView.addSubview(superTextLabel)
        superTextLabel.translatesAutoresizingMaskIntoConstraints = false
        superTextLabel.setFont = 3
        superTextLabel.tag = 88981
        superTextLabel.textSize = textSize
        superTextLabel.textColor = textColor
        superTextLabel.numberOfLines = 0
        superTextLabel.lineBreakMode = .byWordWrapping
        superTextLabel.contentMode = .center
        superTextLabel.topAnchor.constraint(equalTo: emptyImageView.bottomAnchor, constant: 32).isActive = true
        superTextLabel.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        superTextLabel.text = text
        
        // add subtext to this view
        let subTextLabel = BLabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        parentView.addSubview(subTextLabel)
        subTextLabel.setFont = 1
        subTextLabel.translatesAutoresizingMaskIntoConstraints = false
        subTextLabel.numberOfLines = 0
        subTextLabel.tag = 88982
        subTextLabel.textColor = textColor
        subTextLabel.lineBreakMode = .byWordWrapping
        subTextLabel.centerText()
        subTextLabel.layer.masksToBounds = true
        subTextLabel.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 16).isActive = true
        subTextLabel.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -16).isActive = true
        subTextLabel.topAnchor.constraint(equalTo: superTextLabel.bottomAnchor, constant: 16).isActive = true
        subTextLabel.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        subTextLabel.text = subText
        
        // add login button to this view
        let loginButton = BButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        parentView.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitleColor(buttonTextColor, for: .normal)
        loginButton.backgroundcolor = buttonBackgroundColor
        loginButton.tag = 88983
        loginButton.setFont = 2
        loginButton.cornerRadius = 20
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: buttonWidth == 0 ? self.view.frame.width - 48 : buttonWidth).isActive = true
        loginButton.topAnchor.constraint(equalTo: subTextLabel.bottomAnchor, constant: 56).isActive = true
        loginButton.setTitle(buttonText, for: .normal)
        loginButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.goLoginPage)))
        loginButton.isHidden = !showButton
    }
    
    func updateParentViewWithNewData(image: UIImage, imageTopMargin: CGFloat, imageSize: CGFloat = 60, imageHeight: CGFloat = 67 ,imageAlpha: CGFloat = 1, text: String, textColor: UIColor = .black, textSize: CGFloat = 20, subText: String, showButton: Bool = true, buttonText: String = "", buttonTextColor: UIColor = .white, buttonBackgroundColor: UIColor = Colors.primaryColor, buttonWidth: CGFloat = 0 ,viewBackgroundColor: UIColor){
        
        if let imageView = parentView.viewWithTag(88980) as? UIImageView{
            UIView.animate(withDuration: 0.2) {
                imageView.image = image
                imageView.alpha = imageAlpha
            }
        }
        
        if let textLabel = self.parentView.viewWithTag(88981) as? BLabel{
            UIView.animate(withDuration: 0.2) {
                textLabel.setTextWithAnimation(text: text)
                textLabel.textColor = textColor
                textLabel.textSize = textSize
            }
        }
        
        if let subLabel = self.parentView.viewWithTag(88982) as? BLabel{
            subLabel.setTextWithAnimation(text: subText)
        }

        
        if let button = self.parentView.viewWithTag(88983) as? BButton{
            UIView.animate(withDuration: 0.2) {
                button.setTitle(buttonText, for: .normal)
                button.isHidden = !showButton
                button.backgroundcolor = buttonBackgroundColor
            }
        }

        UIView.animate(withDuration: 0.2) {
            self.parentView.layoutIfNeeded()
        }
    }
    
    
    public func hideLoginView(){
        if self.parentView.superview != nil{
            self.parentView.removeFromSuperview()
        }
    }
    
    open func showSnackBar(text: String, bottomMargin: CGFloat = -30, backgroundColor: UIColor = Colors.primaryColor, processing: Bool = false, tag: Int = 100000, snackBarStatus: SnackBarStatus = .regular){
        self.snackBarView.tag = tag
        self.snackBarView.backgroundColor = snackBarStatus == .success ? Colors.successColor : snackBarStatus == .error ? Colors.errorColor : Colors.primaryColor
        if self.snackBarView.superview != nil{
            self.snackBarView.removeFromSuperview()
            self.snackBarSeconds = 3
        }
        self.view.addSubview(self.snackBarView)
       self.snackBarView.translatesAutoresizingMaskIntoConstraints = false
        
        if let label = self.snackBarView.viewWithTag(5002) as? UILabel{
            label.text = text
        }
        
        snackBarView.layoutSubviews()
        
        snackBarView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: bottomMargin).isActive = true
        snackBarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8).isActive = true
        snackBarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8).isActive = true
        
        snackBarView.alpha = 0
        snackBarView.transform = snackBarView.transform.translatedBy(x: 0, y: snackBarView.frame.height)
        
        if processing{
            if let view = snackBarView.viewWithTag(5003) as? UIActivityIndicatorView{
                view.isHidden = false
                view.startAnimating()
            }
        }else{
            if let view = snackBarView.viewWithTag(5003){
                view.isHidden = true
            }
        }
        
        UIView.animate(withDuration: 0.2, animations : {
            self.snackBarView.alpha = 1
            self.snackBarView.transform = .identity
        }) {(success) in
            
            if self.timer == nil && !processing{
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self , selector: (#selector(self.updateSnackBarWithTime)), userInfo: nil, repeats: true )
            }
            
        }
    }
    
    /// hide the snack back after 2 secondes
    @objc func updateSnackBarWithTime(){
        self.snackBarSeconds -= 1
        if self.snackBarSeconds == 0{
            self.timer?.invalidate()
            self.timer = nil
            self.hideSnackBar()
        }
    }
    
    // hide snack bar and stop timer
    func hideSnackBar(){
        UIView.animate(withDuration: 0.2, animations: {
            self.snackBarView.transform = self.snackBarView.transform.translatedBy(x: 0, y: self.snackBarView.frame.height)
            self.snackBarView.alpha = 0
        }){(success) in
            self.snackBarView.removeFromSuperview()
            self.snackBarView.transform = .identity
            self.snackBarView.alpha = 1
            self.snackBarSeconds = 3
            if let view = self.snackBarView.viewWithTag(5003) as? UIActivityIndicatorView{
                view.isHidden = false
                view.stopAnimating()
            }
            self.snackBarHidden(snackBarTag: self.snackBarView.tag)
        }
    }
    
    func snackBarHidden(snackBarTag: Int){}
    
    @objc func goLoginPage(){}
    
    func unreachableNetWork(){
        
    }
    
    /// get object of this view controller
    open class func create(viewControllerId: String, storyBoardId: String) ->  UIViewController{
        return UIStoryboard(name: storyBoardId, bundle: Bundle.main).instantiateViewController(withIdentifier: viewControllerId)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer?.invalidate()
        self.timer = nil
        self.snackBarSeconds = 3
        self.snackBarView.removeFromSuperview()
    }
    
}

