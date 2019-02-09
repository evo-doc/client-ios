//
//  PackagesView.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 05/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class PackagesView: UIScrollView {
    // Init
    // ---------------------------------------------------------------------------------------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Create items
        let emojiSad = UIImageView();
        emojiSad.image = UIImage(named: "emojiSad");
        emojiSad.contentMode = .scaleAspectFit;
        let label = UtilitiesUI.createHeader1("This functionality isn't implemented yet.");
        label.textAlignment = .center;
        
        // Create Stack
        let stack = UtilitiesUI.createVerStack(views: emojiSad, label);
        self.addSubview(stack);
        stack.layoutMargins = UIEdgeInsets(top: 30, left: 15, bottom: 30, right: 15);
        stack.isLayoutMarginsRelativeArrangement = true;
        stack.snp.makeConstraints{
            make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
