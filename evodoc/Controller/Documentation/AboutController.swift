//
//  AboutController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 26/12/2018.
//  Copyright © 2018 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class AboutController: UIViewController {
    // Data
    // ---------------------------------------------------------------------------------------------
    var contentView: AboutView!;
    
    // Lifecycle
    // ---------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad();
        self.title = "About Us";
        view.backgroundColor = .white;
        
        let contentView = AboutView();
        view.addSubview(contentView);
        contentView.snp.makeConstraints{
            make in
            make.edges.equalToSuperview()
        }
        self.contentView = contentView;
        
        setGestures();
    }
    

    // Gestures
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

