//
//  ProjectController.swift
//  EvoDoc
//
//  Created by Tomáš Starý on 07/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

class ProjectController: UIViewController {
    
    let projectView = ProjectView();
    var projectModel: ProjectModel!;
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.title = "Project"
        
        view.addSubview(projectView)
        projectView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.projectView.tableView.delegate = self
        self.projectView.tableView.dataSource = self
    }
}

extension ProjectController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProjectCellModel.cells.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ProjectCellModel.cells[indexPath.row];
    }
}
