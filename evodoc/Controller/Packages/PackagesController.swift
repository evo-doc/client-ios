//
//  ViewController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 26/12/2018.
//  Copyright © 2018 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class PackagesController: UIViewController {
    // Lifecycle functions
    // ---------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad();
        self.title = "Packages";
        
        let contentView = PackagesView();
        view.addSubview(contentView);
        contentView.snp.makeConstraints{
            make in
            make.edges.equalToSuperview()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Navbar title
        self.navigationController?.navigationBar.topItem?.title = "Packages"
        
        // Show right button
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = nil;
    }
}

