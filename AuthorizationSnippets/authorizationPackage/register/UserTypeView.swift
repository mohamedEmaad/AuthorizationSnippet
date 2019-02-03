//
//  UserTypeView.swift
//  Makfy
//
//  Created by Mohamed Emad on 2/2/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import UIKit
import NewBaseFrameWork

class UserTypeView: UIView{
    
    // set the image view for this view
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    // set the label for this view
    lazy var label: BLabel = {
        let view = BLabel()
        view.textColor = Colors.textColor
        view.numberOfLines = 0
        view.font = Fonts.fontRegular(size: 14)
        view.lineBreakMode = .byWordWrapping
        view.centerText()
        
        return view
    }()
    
    // set background view
    lazy var backgroundView: RadiusBackground = {
        let view = RadiusBackground()
        view.backgroundColor = .clear
        view.borderColor = .clear
        
        return view
    }()
    
    init(image: UIImage, text: String) {
        self.init()
        self.imageView.image = image.withRenderingMode(.alwaysTemplate)
        self.imageView.tintColor = Colors.textColor
        self.label.text = text
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
        self.addSubview(self.backgroundView)
        self.backgroundView.addSubview(self.imageView)
        self.backgroundView.addSubview(self.label)
        
        // set constraints for image view
        imageView.snp.makeConstraints { [unowned self] (make) in
            make.top.equalTo(self.backgroundView.snp.top).offset(Dimensions.smallMargin)
            make.width.height.equalTo(30)
            make.centerX.equalTo(self)
        }
        
        // set constraints for the label
        label.snp.makeConstraints { [unowned self] (make) in
            make.top.equalTo(self.imageView.snp.bottom).offset(Dimensions.smallMargin)
            make.leading.equalTo(self).offset(Dimensions.smallMargin)
            make.trailing.bottom.equalTo(self).offset(-Dimensions.smallMargin)
        }
        
        // set constraints for the background view
        backgroundView.snp.makeConstraints { [unowned self](make) in
            make.edges.equalTo(self)
        }
        
    }
    
    // if the user select this view update the view on the selection
    func setSelected(){
        self.backgroundView.isDashed = true
        self.imageView.tintColor = Colors.primaryColor
        self.label.textColor = Colors.primaryColor
    }
    
    // when deselecting this view
    func setDeSelected(){
        self.backgroundView.isDashed = false
        self.imageView.tintColor = Colors.textColor
        self.label.textColor = Colors.textColor
    }
    
}
