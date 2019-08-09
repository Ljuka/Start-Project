//
//  DropdownField.swift
//  onepower-ios
//
//  Created by Ljubo Maricevic on 29/07/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//


import UIKit
import Localize_Swift
import DropDown
import RxCocoa
import RxSwift

@IBDesignable
class DropdownField: UIView {
    
    
//    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var errorMsg: UILabel!
//    @IBOutlet weak var inputLine: UIView!
    @IBOutlet weak var eyeBttn: UIButton!
    @IBOutlet weak var input: UIButton!
    
    let disposeBag = DisposeBag()
    
    var v: UIView!
    
    let chooseDropDown = DropDown()
    var delegate: dropdownActions!
    
//    @IBInspectable public var titleKey: String? {
//        get { return nil }
//        set(key) {
//            self.titleKeyLocal = key ?? ""
//            label.text = key?.localized()
//        }
//    }
    
    @IBInspectable public var placeholderKey: String? {
        get { return nil }
        set(key) {
            self.placeholderKeyLocal = key ?? ""
            //            input.placeholder = key?.localized()
        }
    }
    
    @IBInspectable public var image: UIImage? {
        get { return nil }
        set(image) {
            self.eyeBttn.setImage(image, for: .normal)
            self.eyeBttn.isHidden = false
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
        
        //        self.setupDropDown(label: "DD", dropDownFields: ["String", "aa"])
        
    }
    
    @IBAction func inputPressed(_ sender: Any) {
        chooseDropDown.show()
    }
    
    @IBAction func arrowPressed(_ sender: Any) {
        chooseDropDown.show()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "DropdownField", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if image != nil{
            eyeBttn.isHidden = false
        }
    }
    
    
    
    func setupDropDown(label: String, dropDownFields: [String], selectedItem: String? = nil) {
        
//        self.label.text = label
//        if label == ""{
//            self.label.isHidden = true
//        }
        
        
        self.input.setTitle(selectedItem ?? dropDownFields.first, for: .normal)
        chooseDropDown.dataSource = dropDownFields
        
        chooseDropDown.anchorView = self.input
        
        chooseDropDown.bottomOffset = CGPoint(x: 0, y: chooseDropDown.bounds.height)
        
        // Action triggered on selection
        chooseDropDown.selectionAction = { [weak self] (index, item) in
            if self?.delegate != nil{
                self?.delegate.changedValue(index: index)
            }
            self?.input.setTitle(item, for: .normal)
        }
        
    }
    
    func customizeDropDown(_ sender: AnyObject) {
        let appearance = DropDown.appearance()
        
        appearance.cellHeight = 60
        //        appearance.backgroundColor = appearance.backgroundColor
        appearance.selectionBackgroundColor = UIColor(red: 0.6494, green: 0.8155, blue: 1.0, alpha: 0.2)
        //        appearance.separatorColor = UIColor(white: 0.7, alpha: 0.8)
        appearance.cornerRadius = 10
        appearance.shadowColor = UIColor(white: 0.6, alpha: 1)
        appearance.shadowOpacity = 0.9
        appearance.shadowRadius = 25
        appearance.animationduration = 0.25
        appearance.textColor = .darkGray
        //        appearance.textFont = UIFont(name: "Georgia", size: 14)
        
        //        dropDowns.forEach {
        //            /*** FOR CUSTOM CELLS ***/
        //            $0.cellNib = UINib(nibName: "MyCell", bundle: nil)
        //
        //            $0.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
        //                guard let cell = cell as? MyCell else { return }
        //
        //                // Setup your custom UI components
        //                cell.suffixLabel.text = "Suf` \(index)"
        //            }
        //            /*** ---------------- ***/
        //        }
    }
    
}

protocol dropdownActions {
    func changedValue(index: Int)
}
