//
//  ViewController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 26/12/2018.
//  Copyright © 2018 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class AboutController: UIViewController {
    
    var contentView: AboutView!;
    
    // ---------------------------------------------------------------------------------------------
    // Lifecycle functions
    // ---------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "About Us";
        
        view.backgroundColor = .white;
        
        let contentView = AboutView();
        view.addSubview(contentView);
        contentView.snp.makeConstraints{
            make in
            make.edges.equalToSuperview()
        }
        self.contentView = contentView;
        
        setGestures()
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
    
    func setGestures() {
        // Github Org
        let gestLinkGithubOrg = UITapGestureRecognizer(target: self, action: #selector(self.linkSafariGithubOrg))
        self.contentView.linkGithubOrg.isUserInteractionEnabled = true;
        self.contentView.linkGithubOrg.addGestureRecognizer(gestLinkGithubOrg);
    }
    
    @objc func linkSafariGithubOrg(){
        guard let url = URL(string: "https://github.com/evo-doc/") else { return }
        UIApplication.shared.open(url)
    }
}

