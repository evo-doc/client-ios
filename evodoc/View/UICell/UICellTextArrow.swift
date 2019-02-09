//
//  UICellTextArrow.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 06/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit
import SnapKit

/**
 Creates UITableViewCell with text with arrow at right side of the screen
 */
class UICellTextArrow: UITableViewCell {
    // Data
    // ---------------------------------------------------------------------------------------------
    static let identifier = "UICellTextArrow";
    private var titleText: String = "";
    private var titleColor: UIColor = PaletteConfig.textDark;
    
    
    // Init
    // ---------------------------------------------------------------------------------------------
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.accessoryType = .disclosureIndicator;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(title: String) -> UICellTextArrow {
        self.titleText = title;
        setupView();
        return self;
    }
    
    func setData(title: String, titleColor: UIColor) -> UICellTextArrow {
        self.titleText = title;
        self.titleColor = titleColor;
        setupView();
        return self;
    }
    
    
    // Methods
    // ---------------------------------------------------------------------------------------------
    func setupView() {
        let titleLabel = UILabel();
        titleLabel.text = self.titleText;
        titleLabel.textColor = self.titleColor;
        titleLabel.lineBreakMode = .byWordWrapping;
        
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints{
            make in
            make.top.leading.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 15, bottom: 0, right: 0))
            make.bottom.lessThanOrEqualToSuperview().inset(5)
            make.height.greaterThanOrEqualTo(40)
            make.right.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
        }
    }
    
}
