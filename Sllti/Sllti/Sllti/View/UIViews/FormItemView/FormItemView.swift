//
//  FormItemView.swift
//  BaseiOS
//
//  Created by Mohammad Farhan on 2/9/18.
//  Copyright © 2018 base. All rights reserved.
//

import UIKit
import DropDown
import IQKeyboardManagerSwift

@IBDesignable
class FormItemView: UIView, NibViewProtocol {
    
    // NibViewProtocol
    var contentView: UIView?
    
    weak var testDelegate: TestProtocol?
    
    // MARK: - Outlets
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var textFieldHeightConstraint: NSLayoutConstraint!
    
    // MARK: - IBInspectable
    @IBInspectable var title: String = "" {
        didSet {
            itemTitle.text = title
        }
    }
    
    //    @IBInspectable var text: String = "" {
    //        didSet {
    //            itemTextField.text = text
    //        }
    //    }
    
    @IBInspectable var placeholder: String = "" {
        didSet {
            itemTextField.placeholder = placeholder
        }
    }
    
    @IBInspectable var itemTypeAdapter: Int {
        get { return itemType.rawValue }
        set {
            itemType = FormItemTypeEnum(rawValue: newValue) ?? .none
            configure(itemType: itemType)
        }
    }
    
    // IB: use the adapter
    @IBInspectable var itemKeyboardTypeAdapter: Int {
        get { return itemKeyboardType.rawValue }
        set {
            itemKeyboardType = FormItemKeyboardTypeEnum(rawValue: newValue) ?? .alphanumeric
            configure(keyboardType: itemKeyboardType)
        }
    }
    
    // MARK: - Properties
    var itemType: FormItemTypeEnum = .none {
        didSet { configure(itemType: itemType) }
    }
    var itemKeyboardType: FormItemKeyboardTypeEnum = .alphanumeric {
        didSet { configure(keyboardType: itemKeyboardType) }
    }
    
    let dropDown = DropDown()
    
    // MARK: - Config
    private struct Config {
        static let textFieldHeight = 59.scaledHeight()
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    // MARK: - Setup
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        itemTextField.layer.cornerRadius = 4.0
    }
    
    private func setup() {
        backgroundColor = UIColor.clear
        textFieldHeightConstraint.constant = Config.textFieldHeight
        itemTextField.delegate = self
    }
    
    private func configure(itemType: FormItemTypeEnum) {
        switch itemType {
        case .none:
            actionButton.setImage(nil, for: UIControlState.normal)
        case .erase:
            actionButton.setScaled(imageAssetIdentifier: UIImage.AssetIdentifier.erase)
            (itemTextField as? ScalableTextField)?.rightMargin = 45.scaledWidth()
        case .dropDown:
            actionButton.setScaled(imageAssetIdentifier: UIImage.AssetIdentifier.drop)
            setupDropDown()
        case .date:
            actionButton.setScaled(imageAssetIdentifier: UIImage.AssetIdentifier.calendar)
        }
    }
    
    private func configure(keyboardType: FormItemKeyboardTypeEnum) {
        switch keyboardType {
        case .alphanumeric:
            itemTextField.keyboardType = UIKeyboardType.alphabet
        case .numeric:
            itemTextField.keyboardType = UIKeyboardType.numbersAndPunctuation
        }
    }
    
    @IBAction func actionButtonTaped(_ sender: UIButton) {
        if itemType == FormItemTypeEnum.erase {
            itemTextField.text = nil
            itemTextField = Validation.validate(textField: itemTextField)!
        } else if itemType == .dropDown {
            dropDown.show()
            select(textField: itemTextField)
        }
    }
    
    // DropDown
    private func setupDropDown() {
        dropDown.anchorView = itemTextField
        dropDown.bottomOffset = CGPoint(x: 0, y: Config.textFieldHeight)
        dropDown.topOffset = CGPoint(x: 0, y: -Config.textFieldHeight)
        dropDown.selectionAction = { [weak self] index, value in
            self?.itemTextField.text = value
            if let textField = self?.itemTextField {
                self?.deselect(textField: textField)
            }
        }
        dropDown.cancelAction = { [weak self] in
            if let textField = self?.itemTextField {
                self?.deselect(textField: textField)
            }
        }
    }
    
    fileprivate func select(textField: UITextField!) {
        textField.animate(borderColor: UIColor.azure)
    }
    
    fileprivate func deselect(textField: UITextField) {
        textField.animate(borderColor: UIColor(white: 0.8, alpha: 1.0))
        switch self.dropDown.tag {
        case DropDownEnum.TEST.rawValue:
            testDelegate?.didSelect(test: textField.text!)
            itemTextField = Validation.validate(textField: textField)!
        default:
            testDelegate?.didSelect(test: textField.text!)
            itemTextField = Validation.validate(textField: textField)!
        }
    }
    
    // MARK: - Public API
    func set(text: String) {
        itemTextField.text = text
    }
    
    func getText() -> String? {
        let text = itemTextField.text
        if text.isBlank {
            return nil
        }
        return text
    }
    
    func setDropdown(data: [String]) {
        dropDown.dataSource = data
    }
    
    func disable() {
        actionButton.isEnabled = false
        itemTextField.isEnabled = false
    }
}

// MARK: - UITextFieldDelegate
extension FormItemView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if itemType == .dropDown {
            dropDown.show()
            return false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        deselect(textField: textField)
        dropDown.hide()
    }
}
