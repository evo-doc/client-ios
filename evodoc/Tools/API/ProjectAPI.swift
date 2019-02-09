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
}

