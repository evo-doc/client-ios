//
//  ViewController.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 26/12/2018.
//  Copyright © 2018 evodoc. All rights reserved.
//

import UIKit
import SnapKit

class ProjectsController: UIViewController {
    
    let projectListView = ProjectListView();
    var data: ProjectListModel!;
    
    // ---------------------------------------------------------------------------------------------
    // Lifecycle functions
    // ---------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .yellow;
        self.title = "Projects";
        
        view.addSubview(projectListView)
        projectListView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        projectListView.projectsList.delegate = self;
        projectListView.projectsList.dataSource = self;
        projectListView.projectsList.register(ProjectTableCellView.self, forCellReuseIdentifier: ProjectTableCellView.reuseIdentifier);
        
        ProjectAPI.getProjects(callback: { data in
            self.data = data;
            self.projectListView.projectsList.reloadData();
        })
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Navbar show
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        // Navbar title
        self.navigationController?.navigationBar.topItem?.title = "Projects"
        
        // Navbar right button
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(
            title: "Create",
            style: .plain,
            target: self,
            action: #selector(createProject));
        
        ProjectAPI.getProjects(callback: { data in
            self.data = data;
            self.projectListView.projectsList.reloadData();
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
    }
    
    @objc func createProject() {
        self.navigationController?.pushViewController(CreateProjectController(), animated: true);
    }
    
    // ---------------------------------------------------------------------------------------------
    //
    // ---------------------------------------------------------------------------------------------
}

//Extension for UITableViewDelegate & UITableViewDataSource stuff
extension ProjectsController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let d = self.data {
            return d.projects.data.count;
        } else {
            return 0;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let project = data.projects.data[indexPath.row];
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProjectTableCellView.reuseIdentifier, for: indexPath) as? ProjectTableCellView else {
            return UITableViewCell();
        }
        
        cell.id = project.number
        cell.name = project.name;
        cell.desc = project.text;
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = data.projects.data[indexPath.row];
        let controller = ProjectController();
    
        ProjectAPI.getProject(id: selected.number, callback: {
            data in
            controller.projectModel = data;
            controller.projectId = data.id
            ProjectCellModel.cells.removeAll();

            let name = UICellTitleText().setData(key: "Project Name", value: data.name);
            ProjectCellModel.cells.append(name);
            
            let description = UICellTitleText().setData(key: "Project description", value: data.description);
            ProjectCellModel.cells.append(description);
            
            self.navigationController?.pushViewController(controller, animated: true);
        });
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Delete event
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete;
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        ProjectAPI.deleteProject(
            id: data.projects.data[indexPath.row].number,
            callback: { success in
                if (success) {
                    self.data.projects.data.remove(at: indexPath.row);
                    self.projectListView.projectsList.deleteRows(at: [indexPath], with: .automatic);
                }
        })
        
    }
}

