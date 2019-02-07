//
//  DocumentationView.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 05/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class AboutView: UIScrollView {
    
    // ---------------------------------------------------------------------------------------------
    // Data
    // ---------------------------------------------------------------------------------------------
    
    var linkGithubOrg = UtilitiesUI.createLinkDark("Github Organization");
    
    // ---------------------------------------------------------------------------------------------
    // Init
    // ---------------------------------------------------------------------------------------------
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        // Create Stack
        let stack = UtilitiesUI.createVerStack(views:
            UtilitiesUI.createHeader1("About EvoDoc"),
            UtilitiesUI.createTextDark("The whole project is developed within CTU FIT subjects Software project and Software engineering as an experiment to provide a better experience with writing of longer text documents such as documentations, theses, manuals, etc."),
            
            UtilitiesUI.createTextDark("The main idea of the project is to organise documents into smaller parts – modules that could be repeatedly used in many parts of many papers, e.g. a license in different manuals."),
            UtilitiesUI.createHeader1("Source code"),
            self.linkGithubOrg
        )
        
        self.addSubview(stack)
        stack.layoutMargins = UIEdgeInsets(top: 30, left: 15, bottom: 30, right: 15)
        stack.isLayoutMarginsRelativeArrangement = true
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
