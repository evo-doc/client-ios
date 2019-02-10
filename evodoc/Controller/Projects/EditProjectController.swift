//
//  EditProjectController.swift
//  EvoDoc
//
//  Created by Tomáš Starý on 10/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

class EditProjectController : UIViewController {
    
    var editProjectView = EditProjectView()
    var editProjectModel: EditProjectModel!
    var projectId: Int!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(editProjectView)
        
        editProjectView.snp.makeConstraints {
            make in
            make.edges.equalToSuperview()
        }
        
        editProjectView.tableView.delegate = self;
        editProjectView.tableView.dataSource = self;
        
        editProjectView.tableView.register(UICellTitleInput.self, forCellReuseIdentifier: UICellTitleText.identifier)
        editProjectView.tableView.register(UICellTextAreaInput.self, forCellReuseIdentifier: UICellTitleText.identifier)
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
            action: #selector(saveData))
    }
    
    @objc func saveData() {
        let name = (EditProjectModel.cells[0] as! UICellTitleInput).getValue()
        let desc = (EditProjectModel.cells[1] as! UICellTextAreaInput).getValue()
        ProjectAPI.patchProject(id: projectId, name: name, description: desc, callback: {
            response in
            if response {
                self.navigationController?.popViewController(animated: true)
            } else {
                Utilities.viewAlert(title: "Unable to edit", message: "Some data are too short or non unique.")
            }
        })
    }
}

extension EditProjectController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EditProjectModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return EditProjectModel.cells[indexPath.row];
    }
}
