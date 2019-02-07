//
//  ProfileView.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 07/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit
import SnapKit

// -------------------------------------------------------------------------------------------------
// CELLS
// -------------------------------------------------------------------------------------------------

class ProfileCellAvatarView: UITableViewCell {
    // Data
    // ---------------------------------------------------------------------------------------------
    static let identifier = "ProfileCellAvatarView";
    private var avatarHash: String = "";
    
    // Init
    // ---------------------------------------------------------------------------------------------
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Methods
    // ---------------------------------------------------------------------------------------------
    func setHash(hash: String) {
        self.avatarHash = hash;
        setupView();
    }
    
    func setupView() {
        
        let imageAvatar = UIImageView();
        
        let url = URL(string: "https://www.gravatar.com/avatar/" + self.avatarHash + "?d=identicon&f=y&s=180")
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            let image = UIImage(data: imageData)
            imageAvatar.image = image;
        }
        
        imageAvatar.contentMode = UIView.ContentMode.scaleAspectFit;
        
        
        contentView.addSubview(imageAvatar)
        imageAvatar.snp.makeConstraints{
            make in
            make.top.leading.equalToSuperview().inset(UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 0))
            make.centerX.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview().inset(15)
        }
        
        contentView.sizeToFit()
    }
}



class ProfileCellKeyValueView: UITableViewCell {
    // Data
    // ---------------------------------------------------------------------------------------------
    static let identifier = "ProfileCellKeyValueView";
    private var key: String = "";
    private var value: String = "";
    
    // Init
    // ---------------------------------------------------------------------------------------------
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Methods
    // ---------------------------------------------------------------------------------------------
    func setName(key: String, value: String) {
        self.key = key;
        self.value = value;
        setupView();
    }
    
    func setupView() {
        let keyLabel = UILabel();
        keyLabel.font = keyLabel.font.bold;
        keyLabel.text = self.key;
        
        let valueLabel = UILabel();
        valueLabel.text = self.value;
        
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
            make.top.leading.equalToSuperview().inset(UIEdgeInsets(top: 35, left: 15, bottom: 0, right: 0))
            make.bottom.lessThanOrEqualToSuperview().inset(5)
            make.height.equalTo(40)
        }
    }
}
