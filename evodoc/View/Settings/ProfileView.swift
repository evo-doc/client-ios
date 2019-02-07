//
//  ProfileView.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 07/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class ProfileView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        // Create Stack
        let stack = UtilitiesUI.createVerStack(views:
            UtilitiesUI.createHeader1("Profile View")
        )
        
        self.addSubview(stack)
        stack.layoutMargins = UIEdgeInsets(top: 30, left: 15, bottom: 30, right: 15)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.snp.makeConstraints{
            make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        
        ProfileAPI.getProfile{
            data in
            stack.addArrangedSubview(
                 UtilitiesUI.createTextDark("\(data)")
            )
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
