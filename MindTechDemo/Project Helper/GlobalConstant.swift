//
//  GlobalConstant.swift
//  CollectionApp
//
//  Created by MACBOOK on 17/10/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import Foundation
import UIKit

//MARK: - DEVICE
struct DEVICE {
    static var IS_IPHONE_X = (fabs(Double(SCREEN.HEIGHT - 812)) < Double.ulpOfOne)
}

//MARK: - SCREEN
struct SCREEN
{
    static var WIDTH = UIScreen.main.bounds.size.width
    static var HEIGHT = UIScreen.main.bounds.size.height
}

//MARK:- DocumentDefaultValues
struct DocumentDefaultValues{
    struct Empty{
        static let string =  ""
        static let int =  0
        static let bool = false
        static let double = 0.0
    }
}
