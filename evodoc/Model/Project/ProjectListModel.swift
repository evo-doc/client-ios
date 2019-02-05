//
//  ProjectListModel.swift
//  EvoDoc
//
//  Created by Tomáš Starý on 05/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

struct ProjectListModel : Codable {
    var projects: ProjectData;
    
    struct ProjectData : Codable {
        var label: [String]
        
        var data: [ProjectDataMixed];
        
        struct ProjectDataMixed: Codable {
            let number: Int
            let username: String
            let name: String
            let text: String
            
            init(from decoder: Decoder) throws {
                var container = try decoder.unkeyedContainer()
                number = try container.decode(Int.self)
                username = try container.decode(String.self)
                name = try container.decode(String.self)
                text = try container.decode(String.self)
            }
        }
    }
}
