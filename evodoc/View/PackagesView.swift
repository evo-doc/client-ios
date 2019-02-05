//
//  DocumentationView.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 05/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class PackagesView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Create items
        let emojiSad = UIImageView();
        emojiSad.image = UIImage(named: "emojiSad");
        emojiSad.contentMode = .scaleAspectFit;
        
        let label = UtilitiesUI.createHeader1("This functionality isn't implemented yet.");
        label.textAlignment = .center;
        
        // Create Stack
        let stack = UtilitiesUI.createVerStack(views:
            UtilitiesUI.createTextDark(""),
            emojiSad,
            label,
            UtilitiesUI.createTextDark("")
        )
        self.addSubview(stack)
        stack.snp.makeConstraints{
            make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.width.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
