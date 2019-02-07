//
//  ProfileController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 07/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//


import UIKit
import SnapKit

class ProfileController: UIViewController {
    
    // ---------------------------------------------------------------------------------------------
    // Lifecycle functions
    // ---------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile";
        
        view.backgroundColor = .white;
        
        let contentView = ProfileView();
        view.addSubview(contentView);
        contentView.snp.makeConstraints{
            make in
            make.edges.equalToSuperview()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Show Navbar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // ---------------------------------------------------------------------------------------------
    //
    // ---------------------------------------------------------------------------------------------
    
}

