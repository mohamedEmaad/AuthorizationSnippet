//
//  TableViewObject.swift
//  Makfy
//
//  Created by Mohamed Emad on 2/10/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import Foundation
import UIKit
import RxDataSources

class TableViewObject{
    let image: UIImage
    let name: String
    let phone: String
    
    init(image: UIImage, name: String, phone: String) {
        self.image = image
        self.phone = phone
        self.name = name
    }
}
