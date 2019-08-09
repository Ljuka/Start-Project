//
//  CustomButtonz.swift
//  onepower-ios
//
//  Created by Ljubo Maricevic on 11/07/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import Foundation
import UIKit
import Localize_Swift
import UIFontComplete

class DefaultButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @IBInspectable var isImageRight: Bool = true
    @IBInspectable var isUppercasedTitle: Bool = true
    @IBInspectable var imageMargin: CGFloat = 0
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 24 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var fontSize: CGFloat = 16 {
        didSet {
            self.titleLabel?.font = CustomFonts.montserratSemiBold.of(size: fontSize)
        }
    }
    
    @IBInspectable var bgColor: UIColor? = .mainGreen {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    @IBInspectable var titleColor: UIColor? = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) {
        didSet {
            self.setTitleColor(titleColor, for: .normal)
        }
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.layer.borderWidth = 2
        self.layer.borderColor = #colorLiteral(red: 0.462745098, green: 0.7215686275, blue: 0.3215686275, alpha: 1)
        self.backgroundColor = bgColor
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = CustomFonts.montserratSemiBold.of(size: fontSize)
        self.layer.cornerRadius = cornerRadius
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil && currentTitle != nil {
            if isUppercasedTitle{
                self.setTitle(self.titleLabel?.text?.uppercased(), for: .normal)
            }
            if isImageRight {
                imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -(imageMargin + (titleLabel?.frame.width)! * 2 + (imageView?.frame.width)!))
                titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)! * 1.5)
            } else {
                imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: imageMargin)
                titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
        }
    }
}
