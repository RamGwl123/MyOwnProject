//
//  Constant.swift
//  MyOwnProject
//
//  Created by Ram Naidu on 12/10/24.
//

import UIKit

enum GFSymbals {
    static let location                     = "mappin.and.ellipse"
    static let repos                        = "folder"
    static let gists                        = "text.alignleft"
    static let followers                    = "heart"
    static let following                    = "person.2"
}


enum Images {
    static let ghLogo                       = UIImage(named: "gh-logo")
    static let placeHolder                  = UIImage(named: "avatar-placeholder")!
    static let emptyStateLogoImage          = UIImage(named: "empty-state-logo")
}


enum ScreenSize {
    static let width                        = UIScreen.main.bounds.size.width
    static let height                       = UIScreen.main.bounds.size.width
    static let maxLength                    = max(ScreenSize.width, ScreenSize.height)
    static let minLenght                    = min(ScreenSize.width, ScreenSize.height)
}


enum DeviceType {
    static let idiom                        = UIDevice.current.userInterfaceIdiom
    static let nativeScale                  = UIScreen.main.nativeScale
    static let scale                        = UIScreen.main.scale
    
    static let isiPhoneSE                   = idiom == .phone && ScreenSize.maxLength == 568.0
    static let isiPhone8Standered           = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
    static let isiPhone8Zoomed              = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
    static let isiPhone8PlusStandred        = idiom == .phone && ScreenSize.maxLength == 736.0
    static let isiPhone8PlusZoomed          = idiom == .phone && ScreenSize.maxLength == 736.0 && nativeScale == scale
    static let isiPhoneX                    = idiom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhoneXsmaxandXr           = idiom == .phone && ScreenSize.maxLength == 896.0
    static let isiPad                       = idiom == .phone && ScreenSize.maxLength >= 1024.0
    
    static func isiPhoneAspectRatio() -> Bool {
        return isiPhoneX || isiPhoneXsmaxandXr
    }
}
