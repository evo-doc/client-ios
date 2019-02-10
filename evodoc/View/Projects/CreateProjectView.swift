//
//  CreateProjectView.swift
//  EvoDoc
//
//  Created by Tomáš Starý on 09/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

class CreateProjectView : UIView {

    var tableView: UITableView!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setupView();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    func setupView() {
        let tableView = UITableView(frame: .zero, style: .plain);
        self.addSubview(tableView);
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.allowsSelection = false;
        tableView.backgroundColor = .white;
        tableView.allowsMultipleSelection = false;
        tableView.separatorStyle = .none;
        self.tableView = tableView;
    }
}
