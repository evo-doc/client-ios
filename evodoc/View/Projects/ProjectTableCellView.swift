//
//  ProjectTableCellView.swift
//  EvoDoc
//
//  Created by Tomáš Starý on 05/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

final class ProjectTableCellView: UITableViewCell {
    static let reuseIdentifier = "ProjectTableCellView";
    
    var name: String? {
        get { return nameLabel.text; }
        set { nameLabel.text = newValue; }
    }
    
    var desc: String? {
        get { return descriptionLabel.text; }
        set { descriptionLabel.text = newValue; }
    }
    
    private weak var nameLabel: UILabel!
    private weak var descriptionLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let nameLabel = UILabel();
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline);
        contentView.addSubview(nameLabel);
        nameLabel.snp.makeConstraints {
            make in
            make.top.leading.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 15, bottom: 0, right: 0))
            make.bottom.lessThanOrEqualToSuperview().inset(5)
            make.height.equalTo(40)
        }
        self.nameLabel = nameLabel
        
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(15)
            make.bottom.lessThanOrEqualToSuperview().inset(5)
        }
        self.descriptionLabel = descriptionLabel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
}
