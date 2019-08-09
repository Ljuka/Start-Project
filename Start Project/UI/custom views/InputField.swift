//
//  InputField.swift
//  onepower-ios
//
//  Created by Ljubo Maricevic on 24/07/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import UIKit
import Localize_Swift

@IBDesignable
class InputField: UIView {
    
    @IBOutlet weak var errorMsg: UILabel!
    @IBOutlet weak var inputLine: UIView!
    @IBOutlet weak var input: UITextField!
    
    var v: UIView!
    
    @IBInspectable var isEmailInput: Bool = false
    @IBInspectable var isPassword: Bool = false

    @IBInspectable public var placeholderKey: String? {
        get { return nil }
        set(key) {
            self.placeholderKeyLocal = key ?? ""
            input.placeholder = key?.localized()
        }
    }
    
    var titleKeyLocal: String = ""
    var placeholderKeyLocal: String = ""
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        
        v = loadViewFromNib()
        v.frame = bounds
        v.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(v)
        
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "InputField", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if isEmailInput {
            input.keyboardType = .emailAddress
        }
        if isPassword{
            input.isSecureTextEntry = true
        }
    }
    
}
