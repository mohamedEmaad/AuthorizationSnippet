//
//  StatusClass.swift
//  Waset
//
//  Created by Mohamed Emad on 7/16/18.
//  Copyright © 2018 Baianat. All rights reserved.
//

public protocol StatusClass {
    func showLoading()
    func hideLoading()
    func onError(message:String)
    func onFailure(message : String)

}
