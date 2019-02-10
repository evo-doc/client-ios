//
//  CreateProjectController.swift
//  EvoDoc
//
//  Created by Tomáš Starý on 09/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

class CreateProjectController: UIViewController {
    
    let createProjectView = CreateProjectView();
    var createProjectModel: CreateProjectModel!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        view.addSubview(createProjectView);
        
        createProjectView.snp.makeConstraints { make in
            make.edges.equalToSuperview();
        }
        
        createProjectView.tableView.delegate = self;
        createProjectView.tableView.dataSource = self;
        
        createProjectView.tableView.register(UICellTitleInput.self, forCellReuseIdentifier: UICellTitleText.identifier)
        createProjectView.tableView.register(UICellTextAreaInput.self, forCellReuseIdentifier: UICellTextAreaInput.identifier)
        
        updateTable();
    }
    
    func updateTable() {
        CreateProjectModel.cells.removeAll();

        let name = UICellTitleInput().setData(key: "Project name", value: "");
        CreateProjectModel.cells.append(name);
        
        let description = UICellTextAreaInput().setData(key: "Project description", value: "");
        CreateProjectModel.cells.append(description);
        
        self.createProjectView.tableView.reloadData();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        // Show Navbar
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        
        // Right button
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Create",
            style: .plain,
            target: self,
            action: #selector(saveData));
    }
    
    @objc func saveData() {
        let name = (CreateProjectModel.cells[0] as! UICellTitleInput).getValue()
        let description = (CreateProjectModel.cells[1] as! UICellTextAreaInput).getValue()
        
        ProjectAPI.createProject(
            name: name,
            description: description,
            contributors: [],
            callback: {
                success in
                if success != nil {
                    self.navigationController?.popViewController(animated: true)
                } else {
                    Utilities.viewAlert(title: "Unable to create", message: "Some data are too short or non unique.")
                }
        })
    }
}

extension CreateProjectController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CreateProjectModel.cells.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return CreateProjectModel.cells[indexPath.row];
    }
}
