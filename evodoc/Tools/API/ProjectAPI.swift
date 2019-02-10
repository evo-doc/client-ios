//
//  ProjectAPI.swift
//  EvoDoc
//
//  Created by Tomáš Starý on 05/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import Alamofire

class ProjectAPI {
    
    static func getProjects(
        limit: Int = 0,
        callback: @escaping ((ProjectListModel) -> ())) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + (UserDefaults.standard.value(forKey: "token") as? String ?? "")
        ]
        
        Alamofire.request(
            ServerConfig.host("/user/projects"),
            method: .post,
            parameters: [
                "limit": limit
            ],
            encoding: JSONEncoding.default,
            headers: headers
            ).responseJSON { response in
                
                if let data = response.data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let projects = try
                            jsonDecoder.decode(ProjectListModel.self, from: data);
                        callback(projects)
                    } catch {
                        Utilities.viewAlert(title: "Projects load error", message: "Problem occured during loading projects.")
                    }
                }
        }
    }
    
    static func getProject(
        id: Int,
        callback: @escaping ((ProjectModel) -> ())) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + (UserDefaults.standard.value(forKey: "token") as? String ?? "")
        ]
        
        Alamofire.request(
            ServerConfig.host("/projects/\(id)"),
            method: .get,
            encoding: JSONEncoding.default,
            headers: headers
            ).responseJSON { response in
                if let data = response.data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let project = try
                            jsonDecoder.decode(ProjectModel.self, from: data);
                        callback(project)
                    } catch {
                        print(error)
                        Utilities.viewAlert(title: "Project load error", message: "Problem occured during loading project.")
                    }
                }
            }
    }
    
    /**
     Create a new project for the current user.
     
     # Example call
     
     ```
     ProjectAPI.createProject(
         name: "Name",
         description: "Description",
         contributors: [],
         callback: { project in
            print(project.id)
         }
     )
     ```
    */
    static func createProject(
        name: String,
        description: String,
        contributors: [String],
        callback: @escaping ((ProjectAPICreateModel) -> ())
        ){
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + (UserDefaults.standard.value(forKey: "token") as? String ?? "")
        ]
        
        Alamofire.request(
            ServerConfig.host("/projects/project"),
            method: .post,
            parameters: [
                "name": name,
                "description": description,
                "collaborators": [
                    "contributors": contributors
                ]
            ],
            encoding: JSONEncoding.default,
            headers: headers
            ).responseJSON { response in
                if let data = response.data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let project = try
                            jsonDecoder.decode(ProjectAPICreateModel.self, from: data);
                        callback(project)
                    } catch {
                        print(error)
                        Utilities.viewAlert(title: "Cannot create", message: "The name of the project is too short.")
                    }
                }
        }
    }
    

    /**
     Update an existing project
     
     # Example call
     
     ```
     ProjectAPI.patchProject(
         id: 33,
         name: "New name",
         description: "New description",
         callback: { success in
             if (success) {
                print("Good")
             }
         }
     )
     ```
     */
    static func patchProject(
        id: Int,
        name: String,
        description: String,
        callback: @escaping ((Bool) -> ())
        ){
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + (UserDefaults.standard.value(forKey: "token") as? String ?? "")
        ]
        
        Alamofire.request(
            ServerConfig.host("/projects/\(id)"),
            method: .patch,
            parameters: [
                "name": name,
                "description": description,
                ],
            encoding: JSONEncoding.default,
            headers: headers
            )
            .validate(statusCode: 200...200)
            .responseData { response in
                switch response.result {
                case .success:
                    callback(true)
                case .failure:
                    Utilities.viewAlert(title: "Cannot update", message: "The name of the project is too short.")
                    callback(false)
                }
        }
    }
    
    
    /**
     Delete a project
     
     # Example call
     
     ```
     ProjectAPI.deleteProject(
     id: 33,
     callback: { success in
             if (success) {
                print("Good")
             }
         }
     )
     ```
     */
    static func deleteProject(
        id: Int,
        callback: @escaping ((Bool) -> ())
        ){
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + (UserDefaults.standard.value(forKey: "token") as? String ?? "")
        ]
        
        Alamofire.request(
            ServerConfig.host("/projects/\(id)"),
            method: .delete,
            headers: headers
            )
            .validate(statusCode: 200...200)
            .responseData { response in
                switch response.result {
                case .success:
                    callback(true)
                case .failure:
                    Utilities.viewAlert(title: "Cannot delete", message: "You are not the owner, you may only cancel your contribution.")
                    callback(false)
                }
        }
    }
}
