//
//  SplashVC.swift
//  onepower-ios
//
//  Created Ljubo Maricevic on 11/07/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import XCoordinator

final class SplashVC: UIViewController, ViewModelBindable {

    var viewModel: SplashVM!
    private let disposeBag = DisposeBag()
    typealias ViewModelType = SplashVM

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.exitSplash()
        }
    }
    
    func bindViewModel() {}

}
