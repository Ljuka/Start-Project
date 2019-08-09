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
import Localize_Swift

final class SplashVC: UIViewController, ViewModelBindable {

    var viewModel: SplashVM!
    private let disposeBag = DisposeBag()
    typealias ViewModelType = SplashVM

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.getOffers(lang: Localize.currentLanguage())
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.router.trigger(.main)
//        }
    }

    func bindViewModel() {
        self.viewModel.offersResource.asObservable()
            .filter({ (filter) -> Bool in
                filter.status != .none
            }).subscribe(onNext: {[weak self] _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self?.viewModel.exitSplash(offers: (self?.viewModel.offersResource.value.data)!)
                }
        }).disposed(by: disposeBag)
    }
}
