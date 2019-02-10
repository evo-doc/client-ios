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
    var projectId: Int!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Navbar show
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        // Navbar right button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Edit",
            style: .plain,
            target: self,
            action: #selector(editProject))
        
        update()
    }
    
    @objc func editProject() {
        EditProjectModel.cells.removeAll()
        let controller = EditProjectController()
        let name = (ProjectCellModel.cells[0] as! UICellTitleText).getValue()
        let description = (ProjectCellModel.cells[1] as! UICellTitleText).getValue()
        let nameCell = UICellTitleInput().setData(key: "Project name", value: name)
        let descCell = UICellTextAreaInput().setData(key: "Project description", value: description)
        EditProjectModel.cells.append(nameCell)
        EditProjectModel.cells.append(descCell)
        controller.projectId = self.projectId
        
        navigationController?.pushViewController(controller, animated: true);
    }
    
    func update() {
        ProjectAPI.getProject(id: self.projectId, callback: {
            data in
            self.projectModel = data;
            ProjectCellModel.cells.removeAll();
            
            let name = UICellTitleText().setData(key: "Project Name", value: data.name);
            ProjectCellModel.cells.append(name);
            
            let description = UICellTitleText().setData(key: "Project description", value: data.description);
            ProjectCellModel.cells.append(description);
            
            self.projectView.tableView.reloadData()
        });
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
