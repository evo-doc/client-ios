//
//  DocumentationView.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 05/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class DocumentationView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Create items
        let logo = UIImageView();
        logo.image = UIImage(named: "Logotype");
        logo.contentMode = .scaleAspectFit;
        let screenSignIn = UIImageView();
        screenSignIn.image = UIImage(named: "screenSignIn");
        screenSignIn.contentMode = .scaleAspectFit
  

        // Create Stack
        let stack = UtilitiesUI.createVerStack(views:
            logo,
            UtilitiesUI.createTextDark("EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals."),
            UtilitiesUI.createHeader1("Authorization"),
            screenSignIn,
            UtilitiesUI.createHeader1("Projects"),
            UtilitiesUI.createHeader1("Packages"),
            UtilitiesUI.createTextDark("This functionality isn't implemented yet. Unfurtunately, also no docs.")
        )
        
        self.addSubview(stack)
        stack.layoutMargins = UIEdgeInsets(top: 30, left: 15, bottom: 30, right: 15)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.snp.makeConstraints{
            make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        
        // Content contraints
        logo.snp.makeConstraints{
            make in
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
