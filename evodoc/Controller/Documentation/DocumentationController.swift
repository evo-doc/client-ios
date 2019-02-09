//
//  DocumentationController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 26/12/2018.
//  Copyright © 2018 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class DocumentationController: UIViewController {
    // Lifecycle
    // ---------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad();
        self.title = "Documentation";
        
        let contentView = DocumentationView();
        view.addSubview(contentView);
        contentView.snp.makeConstraints{
            make in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        // Show Navbar
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        self.navigationController?.navigationBar.topItem?.title = "Documentation";
        
        // Show right button
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(
            title: "About Us",
            style: .done,
            target: self,
            action: #selector(gotoAboutUs));
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        
        // Hide right button
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = nil;
    }
    

    // Gestures
    // ---------------------------------------------------------------------------------------------
    @objc func gotoAboutUs(){
        self.navigationController?.pushViewController(AboutController(), animated: true);
    }
}

