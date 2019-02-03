//
//  TextValidator.swift
//  Makfy
//
//  Created by Mohamed Emad on 1/21/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import Foundation
import RxSwift

class TextValidator {
    var input: Observable<String>
    var regex: RegEx
    
    init(input: Observable<String>, regex: RegEx) {
        self.input = input
        self.regex = regex
    }
    
    func validate() -> Observable<Bool> {
        return input.map { text in
            //return true if regex matches the text
            let stringTest = NSPredicate(format:"SELF MATCHES %@", self.regex.rawValue)
            let result = stringTest.evaluate(with: text)
            return result
        }
    }
}

enum RegEx: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" // Email
    case password = "^.{6,15}$" // Password length 6-15
    case alphabeticStringWithSpace = "^[a-zA-Z ]*$" // e.g. hello sandeep
    case alphabeticStringFirstLetterCaps = "^[A-Z]+[a-zA-Z]*$" // SandsHell
    case phoneNo = "^[+]*[0-9]{10,14}" // PhoneNo 10-14 Digits        //Change RegEx according to your Requirement
    case id = "[0-9]{0,10}"
    case empty = "^.{7}$"
    case arabicLetters = "[گچپژیلفقهمو ء-ي]+$"
}
