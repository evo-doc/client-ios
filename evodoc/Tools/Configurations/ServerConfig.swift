//
//  ServerConfig.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 04/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

class ServerConfig {
    static let domain = "http://104.248.129.160"
    
    static func host(_ url: String) -> String {
        return self.domain + url;
    }
}
