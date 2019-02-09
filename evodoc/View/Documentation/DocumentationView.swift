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
    // Init
    // ---------------------------------------------------------------------------------------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Create items
        let screenSignIn = UIImageView();
        screenSignIn.image = UIImage(named: "screenSignIn");
        screenSignIn.contentMode = .scaleAspectFit;
        let screenSettings = UIImageView();
        screenSettings.image = UIImage(named: "screenSettings");
        screenSettings.contentMode = .scaleAspectFit;
  

        // Create Stack
        let stack = UtilitiesUI.createVerStack(views:
            UtilitiesUI.createTextDark("EvoDoc is an abbreviation for evolvable documents.The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals."),
            UtilitiesUI.createHeader1("Authorization"),
            screenSignIn,
            UtilitiesUI.createHeader1("Projects"),
            UtilitiesUI.createHeader1("Packages"),
            UtilitiesUI.createTextDark("This functionality isn't implemented yet. Unfurtunately, also no docs."),
            UtilitiesUI.createHeader1("Settings"),
            screenSettings,
            UtilitiesUI.createTextDark("At the settings page you can view your profile, open a github contribution links or log out from the system.")
        )
        
        self.addSubview(stack)
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
