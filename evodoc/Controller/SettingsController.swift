//
//  ViewController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 26/12/2018.
//  Copyright © 2018 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class SettingsController: UIViewController {
    
    // ---------------------------------------------------------------------------------------------
    // Lifecycle functions
    // ---------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        self.title = "Settings";
        
        let labelToken = UILabel();
        labelToken.text = UserDefaults.standard.value(forKey: "token") as? String
        view.addSubview(labelToken)
        labelToken.snp.makeConstraints{
            make in
            make.top.equalTo(view.snp.topMargin)
            make.right.equalTo(view.snp.rightMargin)
            make.left.equalTo(view.snp.leftMargin)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Show Navbar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // ---------------------------------------------------------------------------------------------
    //
    // ---------------------------------------------------------------------------------------------
    
}

