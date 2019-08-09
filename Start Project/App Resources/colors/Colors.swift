//
//  Colors.swift
//  onepower-ios
//
//  Created by Ljubo Maricevic on 12/07/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    @nonobjc class var mainGreen: UIColor {
        return UIColor(hex: "#76B852")
    }
    
    @nonobjc class var mainTitle: UIColor {
        return UIColor(hex: "#4D483E")
    }
    
    @nonobjc class var secondaryGreen: UIColor {
        return UIColor(hex: "#11998E")
    }
    
    @nonobjc class var mainText: UIColor {
        return UIColor(hex: "#53524D")
    }
    
    @nonobjc class var mainError: UIColor {
        return UIColor(hex: "#EC245A")
    }
    
    @nonobjc class var greyDisabled: UIColor {
        return UIColor(hex: "#D4E0E4")
    }
}

extension UIColor {
    convenience init(hex: String){
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(red: 0, green: 0, blue: 0, alpha: 0)
        } else {
            var rgbValue:UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            
            self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        }
    }
}
