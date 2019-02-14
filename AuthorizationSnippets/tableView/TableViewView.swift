//
//  TableViewView.swift
//  Makfy
//
//  Created by Mohamed Emad on 2/9/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import NewBaseFrameWork
import SnapKit
import UIKit
import RxSwift
import RxCocoa

class TableViewView: UIView {
    
    var disposeBag: DisposeBag!
    
   
    
    init(disposeBag: DisposeBag) {
        self.init()
        self.disposeBag = disposeBag
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addConstraintsAndView(){
        
     
//        self.tableView.rx.setDelegate(self)
    }
}
