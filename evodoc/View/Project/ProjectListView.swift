//
//  ProjectListView.swift
//  EvoDoc
//
//  Created by Tomáš Starý on 05/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

class ProjectListView: UIView {

    var projectsList: UITableView!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        let projectsList = UITableView(frame: .zero, style: .grouped);
        self.addSubview(projectsList)
        projectsList.snp.makeConstraints { make in
            make.edges.equalToSuperview();
        }
        self.projectsList = projectsList;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
}
