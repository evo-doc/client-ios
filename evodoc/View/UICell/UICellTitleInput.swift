//
//  UICellTextInput.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 08/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

class UICellTitleInput: UITableViewCell {
    // Data
    // ---------------------------------------------------------------------------------------------
    static let identifier = "UICellTitleInput";
    private var cellKey: String = "";
    private var cellValue: String = "";
    private var valueLabel: UITextField!;
    
    
    // Init
    // ---------------------------------------------------------------------------------------------
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(key: String, value: String) {
        self.cellKey = key;
        self.cellValue = value;
        setupView();
    }
    
    
    // API Methods
    // ---------------------------------------------------------------------------------------------
    func getOriginalValue() -> String {
        return cellValue;
    }
    
    func getValue() -> String {
        return self.valueLabel.text ?? "";
    }
    
    func isHidden(_ value: Bool) {
        self.valueLabel.isSecureTextEntry = value;
    }
    
    
    // Methods
    // ---------------------------------------------------------------------------------------------
    func setupView() {
        let keyLabel = UILabel();
        keyLabel.font = keyLabel.font.bold;
        keyLabel.text = self.cellKey;
        
        let valueLabel = UITextField();
        valueLabel.text = self.cellValue;
        valueLabel.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.03)
        valueLabel.addPadding(.both(10))
        valueLabel.layer.cornerRadius = 10
        valueLabel.layer.borderWidth = 1
        valueLabel.layer.borderColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        self.valueLabel = valueLabel;
        
        contentView.addSubview(keyLabel)
        keyLabel.snp.makeConstraints{
            make in
            make.top.leading.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 15, bottom: 0, right: 0))
            make.bottom.lessThanOrEqualToSuperview().inset(5)
            make.height.equalTo(40)
        }
        
        contentView.addSubview(valueLabel)
        valueLabel.snp.makeConstraints{
            make in
            make.top.leading.equalToSuperview().inset(UIEdgeInsets(top: 45, left: 15, bottom: 0, right: 0))
            make.bottom.lessThanOrEqualToSuperview().inset(5)
            make.height.equalTo(40)
            make.right.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
        }
    }
}
