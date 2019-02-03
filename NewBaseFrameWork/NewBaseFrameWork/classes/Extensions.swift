//
//  Extesnsions.swift
//  BaseApp
//
//  Created by Yousef on 10/30/18.
//  Copyright © 2018 Yousef. All rights reserved.
//

import UIKit
import AVKit

extension String {
    
    public func parse<D>(to type: D.Type) -> D? where D: Decodable {
        
        let data: Data = self.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        
        do {
            let _object = try decoder.decode(type, from: data)
            return _object
            
        } catch {
            return nil
        }
    }
    
    public func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()
        
        return label.frame.height
    }
    
    
    var localize : String {
        return BString.getText(stringKey: self)
    }

    public func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
}

extension UITableView{
    
    public func scrollToBottom(animated: Bool, numOfSections: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            let numberOfSections = numOfSections
            let numberOfRows = self.numberOfRows(inSection: numberOfSections-1)
            
            if numberOfRows > 0 {
                let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
                self.scrollToRow(at: indexPath, at: .bottom, animated: animated)
            }
        }
    }
    
    public func scrollToTop(animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            let indexPath = IndexPath(row: 0, section: 0)
            self.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
}


extension UIScrollView{
    
    public func addRefreshSubview() -> UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull_to_refresh".localize)
        self.addSubview(refreshControl)
        return refreshControl
    }
    
    public func setScrollToTop(){
        self.setContentOffset(.zero, animated: true)
    }
    
    public func setScrollToBottom(){
        self.setContentOffset(CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height + self.contentInset.bottom), animated: true)
    }
}

extension UIButton {
    public func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount+5 , bottom: 0, right: insetAmount+5)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount+5, bottom: 0, right: -insetAmount+5)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount + 10 , bottom: 0, right: insetAmount + 10)
    }
    
    public func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true  // add this to maintain corner radius
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
           
            UIView.animate(withDuration: 0.4) {
                self.setBackgroundImage(colorImage, for: forState)
            }
            
        }
    }
}

extension UINavigationController {

    static var _myComputedProperty = [String:Bool]()

    var defaultBar :Bool {
        get {
            return UINavigationController._myComputedProperty[self.debugDescription] ?? true
        }
        set(newValue) {
            self.setNeedsStatusBarAppearanceUpdate()
            UINavigationController._myComputedProperty[self.debugDescription] = newValue
        }
    }
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return self.defaultBar ? .default : .lightContent
    }
    
    /**
        handles hide navigation bar
     */
    public func hideBar(){
        self.setNavigationBarHidden(true, animated: true)
    }
    
    /**
        show navigation bar
     */
    public func showBar(){
        self.setNavigationBarHidden(false, animated: true)
    }
}

extension UIView {
    
    // add constraints to view
    public func pin(to view: UIView) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    /**
     start connecting animation while trying to connect the doctor
     */
    public func startConnectingView(){
        
        self.alpha = 0
        self.transform = self.transform.scaledBy(x: 0.9, y: 0.9)
        
        UIView.animate(withDuration: 1.0, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.alpha = 1
            self.transform = .identity
        }, completion: nil)
        
    }
    
    public func validationError(){
        self.layer.borderColor = UIColor.red.cgColor
        self.errorAnimateView(view: self)
    }
    
    public func errorAnimateView(view: UIView){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x - 10, y: view.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: view.center.x + 10, y: view.center.y))
        
        view.layer.add(animation, forKey: "position")
    }
    
    public func setCornerRaduis(raduis: CGFloat){
        self.layer.cornerRadius = raduis
        self.layer.masksToBounds = true
    }
    
    public func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    // OUTPUT 2
    public func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
        public func displaySpinner(_ top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, leadingConstant: CGFloat, trailingConstant: CGFloat, topConstant: CGFloat = 0, bottomConstant: CGFloat = 0) -> UIView {
            let spinnerView = UIView.init(frame: bounds)
            self.addSubview(spinnerView)
            spinnerView.translatesAutoresizingMaskIntoConstraints = false
            spinnerView.anchorToTop(top, leading: leading, bottom: bottom, trailing: trailing, leadingConstant: leadingConstant, trailingConstant: trailingConstant, topConstant: topConstant, bottomConstant: bottomConstant)
            spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.2)
            let ai = UIActivityIndicatorView.init(style: .whiteLarge)
            ai.startAnimating()
            ai.center.x = spinnerView.center.x
            ai.center.y = spinnerView.center.y
            
            DispatchQueue.main.async {
                spinnerView.addSubview(ai)
            }
            
            return spinnerView
        }
    
        func removeSpinner(spinner :UIView) {
            DispatchQueue.main.async {
                spinner.removeFromSuperview()
            }
        }

    
    
    public func anchorToTop(_ top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, leadingConstant: CGFloat, trailingConstant: CGFloat, topConstant: CGFloat = 0, bottomConstant: CGFloat = 0) {
        
        anchorWithConstantsToTop(top, leading: leading, bottom: bottom, trailing: trailing, topConstant: topConstant, leadingConstant: leadingConstant, bottomConstant: bottomConstant, trailingConstant: trailingConstant)
    }
    
    public func anchorWithConstantsToTop(_ top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leadingConstant: CGFloat = 0, bottomConstant: CGFloat = 0, trailingConstant: CGFloat = 0) {
        
        _ = anchor(top, leading: leading, bottom: bottom, trailing: trailing, topConstant: topConstant, leadingConstant: leadingConstant, bottomConstant: bottomConstant, trailingConstant: trailingConstant)
    }
    
    public func anchor(_ top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leadingConstant: CGFloat = 0, bottomConstant: CGFloat = 0, trailingConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        
        if let leading = leading {
            anchors.append(leadingAnchor.constraint(equalTo: leading, constant: leadingConstant))
        }
        
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        
        if let trailing = trailing {
            anchors.append(trailingAnchor.constraint(equalTo: trailing, constant: -trailingConstant))
        }
        
        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        anchors.forEach({$0.isActive = true})
        
        return anchors
    }
    
}

extension UITextField{
    public func validationError(errorMessage: String){
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.red.cgColor
        // set the error message with the red color
        //        self.text = errorMessage
        self.errorAnimateView(view: self)
    }

    public func clearView(){
        self.layer.borderColor = Colors.primaryColor.cgColor
    }
}

extension UIViewController{
    
    /**
     change the title of the navigation bar with animation
     */
    open func animateNavigationBarTitle(text: String){
        let fadeTextAnimation = CATransition()
        fadeTextAnimation.duration = 0.2
        fadeTextAnimation.type = CATransitionType.fade
        self.navigationController?.navigationBar.layer.add(fadeTextAnimation, forKey: "fadeText")
        self.navigationItem.title = text
    }
    
}

extension Notification.Name {
    static let didNewProjectInserted = Notification.Name("didNewProjectInserted")
    static let didActiveStatus = Notification.Name("didActiveStatus")
    static let hereWeGoTest = Notification.Name("hereWeGoTest")
    static let projectData = Notification.Name("projectData")
    static let googleNotification = Notification.Name("googleNotification")
    static let profileDataIsUpdated = Notification.Name("profileDataIsUpdated")
    static let notificationChange = Notification.Name("newNotificationsRecieved")
    static let createdNewConsultation = Notification.Name("newConstultationCreated")
    static let patientCanceledCall = Notification.Name("patient_canceled_consultation")
    static let doctorCanceledCall = Notification.Name("doctor_canceled_consultation")
}

extension UIImageView{
    
    static var loadedImage: UIImage? = nil
    
    public func circleImage(){
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    
//    public func loadImageUrl(imageUrl: String, placeholder: UIImage){
//        let imgUrl = URL(string: (imageUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!))
//        self.sd_setImage(with: imgUrl, placeholderImage: placeholder, options:[ .scaleDownLargeImages, .continueInBackground ])
//    }
    
    /**
     set the image for imag with animatoin
     */
    public func changeImageWithAnimation(selectedImage: UIImage){
        UIView.transition(with: self,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: { self.image = selectedImage },
                          completion: nil)
    }
}

extension Date {
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return  formatter.string(from: self)
    }
}

extension UICollectionView{
    public func reloadSectionData(){
        self.reloadSections(NSIndexSet(index: 0) as IndexSet)
    }
}

extension UITableView{
    public func reloadSectionData(){
        self.reloadSections(NSIndexSet(index: 0) as IndexSet, with: .automatic)
    }
}


//extension ApiHelperImp{
//
//    /// perform any subscribtion happens for this subscribtion
//    func performSubcription<T: GraphQLSubscription>(subscription: T, withHeader: Bool = true, closeIt: Bool = true) -> Observable<T.Data?>{
//        let apolloClient = ApolloClientManager.instance.getSubscribtionClient()
//
//        return Observable<T.Data?>.create({ (observer) -> Disposable in
//
//            apolloClient.subscribe(subscription: subscription){
//                (result, error) in
//                DispatchQueue.main.async {
//                    if error != nil{
//                        observer.onError(error!)
//                        return
//                    }
//                    observer.onNext(result?.data)
//
//                    if closeIt{
//                        observer.onCompleted()
//                    }
//
//                }
//            }
//
//            return Disposables.create()
//        })
//
//    }
//
//    /// perform the mutation with the header token or without header
//    func performMutation<T: GraphQLMutation>(mutation: T, withHeader: Bool = true) -> Observable<T.Data?>{
//        var apolloClient : ApolloClient? = ApolloClientManager.instance.getApolloClientWithHeader()
//        if !withHeader{
//            apolloClient = ApolloClientManager.instance.getApolloClient()
//        }
//        return Observable<T.Data?>.create({ (observer) -> Disposable in
//            apolloClient?.perform(mutation: mutation){
//                (result, error) in
//                DispatchQueue.main.async {
//                    if error != nil{
//                        observer.onError(error!)
//                        return
//                    }
//                    observer.onNext(result?.data)
//                    observer.onCompleted()
//                }
//            }
//            apolloClient = nil
//            return Disposables.create()
//        })
//
//    }
//
//    /// if the user wanna fetch aquery with header token or not
//    func fetchQuery<T: GraphQLQuery>(query: T, withHeader: Bool = true) -> Observable<T.Data?>{
//        var apolloClient : ApolloClient? = ApolloClientManager.instance.getApolloClientWithHeader()
//        if !withHeader{
//            apolloClient = ApolloClientManager.instance.getApolloClient()
//        }
//        return Observable<T.Data?>.create({ (observer) -> Disposable in
//            apolloClient?.fetch(query: query){
//                (result, error) in
//
//                if error != nil{
//                    observer.onError(error!)
//                    return
//                }
//                observer.onNext(result?.data)
//                return
//            }
//            apolloClient = nil
//            return Disposables.create()
//        })
//    }
//}

extension UIViewController{
    public func hideBackTitle(){
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
}


extension UINavigationController {
    
    public func pushViewController(viewController: UIViewController,
                                   animated: Bool,
                                   completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    /**
     hide back title and leave the arros
     */
    public func setNavigationControllerTintToBlack(color: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)){
        /// change back button color to be black and remove back title from this button
        self.navigationBar.tintColor = color
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : color, NSAttributedString.Key.font: Fonts.fontSemiBold(size: 22)]

    }
    
}

extension UILabel{
   public func setTextWithAnimation(text: String){
            let fadeTextAnimation = CATransition()
            fadeTextAnimation.duration = 0.2
            fadeTextAnimation.type = CATransitionType.fade
            self.layer.add(fadeTextAnimation, forKey: "fadeText")
            self.text = text
    }
}

extension UIButton{
    public func setTitleWithAnimation(text: String){
        let fadeTextAnimation = CATransition()
        fadeTextAnimation.duration = 0.2
        fadeTextAnimation.type = CATransitionType.fade
        self.layer.add(fadeTextAnimation, forKey: "fadeText")
        self.setTitle(text, for: .normal)
    }
}

public enum SnackBarStatus {
    case success
    case error
    case regular
}

extension UIRefreshControl {
    public func programaticallyBeginRefreshing(in tableView: UITableView) {
        beginRefreshing()
        let offsetPoint = CGPoint.init(x: 0, y: -frame.size.height)
        tableView.setContentOffset(offsetPoint, animated: true)
    }
}

extension UIImage {
    public func imageWithInsets(insetDimen: CGFloat) -> UIImage {
        return imageWithInset(insets: UIEdgeInsets(top: insetDimen, left: insetDimen, bottom: insetDimen, right: insetDimen))
    }
    
    public func imageWithInset(insets: UIEdgeInsets) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(
            CGSize(width: self.size.width + insets.left + insets.right, height: self.size.height + insets.top + insets.bottom), false, self.scale)
        let origin = CGPoint(x: insets.left, y: insets.top)
        self.draw(at: origin)
        let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageWithInsets!
    }
    
}

extension UIStackView{
    public func pinBackground(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(view, at: 0)
        view.pin(to: self)
    }
}
