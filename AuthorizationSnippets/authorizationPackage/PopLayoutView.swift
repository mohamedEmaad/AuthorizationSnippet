
//
//  PopLayoutView.swift
//  Makfy
//
//  Created by Mohamed Emad on 1/21/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import Foundation
import AMPopTip
import NewBaseFrameWork

class PopLayoutView{
    
    private lazy var popTip = PopTip()
    
    func showPopTip(text: String, color: UIColor = Colors.errorColor, view: UIView, direction: PopTipDirection, selectedViewFrame: CGRect, clickDismiss: Bool = true) {
        popTip.entranceAnimation = .scale
        popTip.backgroundColor = color
        popTip.shouldDismissOnTap = clickDismiss
        popTip.show(text: text, direction: direction, maxWidth: 300, in: view, from: selectedViewFrame)
    }
    
    func hidePop(){
        if popTip.isVisible{
            self.popTip.hide()
        }
    }
    
}
