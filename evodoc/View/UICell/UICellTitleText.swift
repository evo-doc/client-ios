//
//  UICellTextKeyValue.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 08/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

/**
 Creates UITableViewCell representing Text value
 */
class UICellTitleText: UITableViewCell {
    // Data
    // ---------------------------------------------------------------------------------------------
    static let identifier = "UICellTitleText";
    private var cellKey: String = "";
    private var cellValue: String = "";
    
    
    // Init
    // ---------------------------------------------------------------------------------------------
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.backgroundColor = UIColor(white: 1, alpha: 0)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(key: String, value: String) -> UICellTitleText {
        self.cellKey = key;
        self.cellValue = value;
        setupView();
        return self;
    }
    
    
    // Methods
    // ---------------------------------------------------------------------------------------------
    func setupView() {
        let keyLabel = UILabel();
        keyLabel.font = keyLabel.font.bold;
        keyLabel.text = self.cellKey;
        
        let valueLabel = UILabel();
        valueLabel.text = self.cellValue;
        valueLabel.numberOfLines = 0;
        
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
            make.top.leading.equalToSuperview().inset(UIEdgeInsets(top: 40, left: 15, bottom: 0, right: 0))
            make.bottom.lessThanOrEqualToSuperview().inset(5)
            make.right.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
        }
    }
}


