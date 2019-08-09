//
//  BindableViewModel.swift
//  xCoordinatorsTest
//
//  Created by Ljubo Maricevic on 19/02/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import Foundation
import UIKit

protocol ViewModelBindable: AnyObject {
    associatedtype ViewModelType
    var viewModel: ViewModelType! { get set }
    
    func bindViewModel()
}

extension ViewModelBindable where Self: UIViewController {
    func bind(to model: Self.ViewModelType) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}

extension ViewModelBindable where Self: UITableViewCell {
    func bind(to model: Self.ViewModelType) {
        viewModel = model
        bindViewModel()
    }
}

extension ViewModelBindable where Self: UICollectionViewCell {
    func bind(to model: Self.ViewModelType) {
        viewModel = model
        bindViewModel()
    }
}
