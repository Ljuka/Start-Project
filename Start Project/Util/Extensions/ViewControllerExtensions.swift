//
//  ViewControllerExtensions.swift
//  remoney2-ios-shops
//
//  Created by Ljubo Maricevic on 15/05/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

extension UIViewController {
    
    enum ToastGravity {
        case top
        case bottom
    }
    
    func showToast(message : String, gravity: ToastGravity) {
        var y: CGFloat
        switch gravity {
        case .top:
            y = 100
        case .bottom:
            y = self.view.frame.size.height-100
        }
        let toastLabel = UILabel(frame: CGRect(x: CGFloat(self.view.frame.size.width - CGFloat(message.count * 10))/2, y: y, width: CGFloat(message.count * 10), height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Helvetica", size: 14.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 2.0, delay: 3, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

extension NVActivityIndicatorViewable where Self: UIViewController {
    func showLoading(){
        NVActivityIndicatorView.DEFAULT_BLOCKER_SIZE = CGSize(width: 40, height: 40)
        NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6004922945)
        NVActivityIndicatorView.DEFAULT_TYPE = .ballClipRotatePulse
//        NVActivityIndicatorView.DEFAULT_COLOR = .mainBlue
        self.startAnimating()
    }
    
    func hideLoading(){
        self.stopAnimating()
    }
}
