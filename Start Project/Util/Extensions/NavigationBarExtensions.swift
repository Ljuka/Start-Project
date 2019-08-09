//
//  NavigationBarExtensions.swift
//  onepower-ios
//
//  Created by Ljubo Maricevic on 22/07/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    func transparentNavigationBar() {
        self.setBackgroundImage(nil, for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
        self.backgroundColor = .clear
        self.barTintColor = .clear
    }
}
