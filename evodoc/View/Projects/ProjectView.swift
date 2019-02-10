//
//  ProjectView.swift
//  EvoDoc
//
//  Created by Tomáš Starý on 07/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

class ProjectView: UIView {
    
    var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setupView();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    func setupView() {
        let tableView = UITableView(frame: .zero, style: .plain);
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
             make.edges.equalToSuperview()
        }
        tableView.allowsSelection = false;
        tableView.separatorColor = UIColor(white: 1, alpha: 0)
        tableView.backgroundColor = .white
        self.tableView = tableView
    }
}
