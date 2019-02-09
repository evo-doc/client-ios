//
//  UICellTextKeyValue.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 08/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

/**
 Create hint as UITableViewCell
 */
class UICellNotes: UITableViewCell {
    // Data
    // ---------------------------------------------------------------------------------------------
    static let identifier = "UICellNotes";
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
    
    func setData(value: String) -> UICellNotes {
        self.cellValue = value;
        setupView();
        return self;
    }
    
    
    // Methods
    // ---------------------------------------------------------------------------------------------
    func setupView() {
        let valueLabel = UILabel();
        valueLabel.text = self.cellValue.uppercased();
        valueLabel.textColor = PaletteConfig.textGray;
        valueLabel.numberOfLines = 0;
        valueLabel.font = UIFont(name: valueLabel.font.fontName, size: 12)
        
        contentView.addSubview(valueLabel)
        valueLabel.snp.makeConstraints{
            make in
            make.top.leading.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 20, bottom: 0, right: 0))
            make.bottom.lessThanOrEqualToSuperview().inset(5)
            make.right.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20))
        }
    }
}


