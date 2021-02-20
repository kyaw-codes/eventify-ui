//
//  UIColor+extensions.swift
//  Eventify
//
//  Created by Ko Kyaw on 14/02/2021.
//

import UIKit

extension UIColor {
    
    static var colorAccent: UIColor {
        get {
            return UIColor(red: 241/255, green: 105/255, blue: 103/255, alpha: 1)
        }
    }

    static var colorPrimary: UIColor {
        get {
            return UIColor(red: 103/255, green: 114/255, blue: 241/255, alpha: 1)
        }
    }
    
    static var colorSecondary: UIColor {
        get {
            return UIColor(red: 45/255, green: 57/255, blue: 70/255, alpha: 1)
        }
    }

    static var colorTitle: UIColor {
        get {
            return UIColor(red: 45/255, green: 49/255, blue: 54/255, alpha: 1)
        }
    }
    
    static var colorSubtitleOne: UIColor {
        get {
            return UIColor(red: 151/255, green: 153/255, blue: 162/255, alpha: 1)
        }
    }
    
    static var colorSubtitleTwo: UIColor {
        get {
            return UIColor(red: 122/255, green: 124/255, blue: 132/255, alpha: 1)
        }
    }
    
    static var colorTabUnselected: UIColor {
        get {
            return UIColor(red: 155/255, green: 162/255, blue: 250/255, alpha: 1)
        }
    }
    
    static var colorGrayBackground: UIColor {
        get {
            return UIColor(red: 239/255, green: 240/255, blue: 253/255, alpha: 1)
        }
    }
}
