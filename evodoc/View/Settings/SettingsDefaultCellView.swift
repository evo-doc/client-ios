//
//  SettingsDefaultCellView.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 06/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class SettingsDefaultCellView: UITableViewCell {
    
    // ---------------------------------------------------------------------------------------------
    // Data
    // ---------------------------------------------------------------------------------------------
    
    static let identifier = "SettingsDefaultCellView";
    
    var titleLabel: UILabel = {
        let label = UILabel();
        label.text = "Text";
        return label;
    }()
    
    // ---------------------------------------------------------------------------------------------
    // Init
    // ---------------------------------------------------------------------------------------------
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        setupView();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ---------------------------------------------------------------------------------------------
    // Methods
    // ---------------------------------------------------------------------------------------------
    
    func setupView() {
        addSubview(titleLabel)
        titleLabel.clipsToBounds = true
        titleLabel.snp.makeConstraints{
            make in
            make.top.leading.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 15, bottom: 0, right: 0))
            make.bottom.lessThanOrEqualToSuperview().inset(5)
            //            make.size.equalTo(30).priority(999)
            make.height.equalTo(40)
            make.width.equalToSuperview()
        }
    }
    
}
