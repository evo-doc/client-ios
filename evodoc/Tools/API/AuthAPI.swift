//
//  AuthAPI.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 04/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import Alamofire

struct AuthAPISignInSuccessModel : Codable {
    var token: String;
    var username: String;
}


class AuthAPI {
    // Send authorization data to get token
    // ---------------------------------------------------------------------------------------------
    static func postSignIn(
        login: String,
        password: String,
        callback: @escaping ((AuthAPISignInSuccessModel) -> ())
        ) {
        
        Alamofire.request(
            ServerConfig.host("/auth/signin"),
            method: .post,
            parameters: [
                "login": login,
                "password": password
            ],
            encoding: JSONEncoding.default
            ).responseJSON { response in
                
                if let data = response.data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let auth = try jsonDecoder.decode(AuthAPISignInSuccessModel.self, from: data)
                        
                        callback(auth)
                    } catch {
                        // print(error)
                        Utilities.viewAlert(title: "Authorization Error", message: "Username/E-mail or password is wrong.")
                    }
                }
        }
    }
    
    
    // Check authorization
    // ---------------------------------------------------------------------------------------------
    static func isAuthorised(
        callback: @escaping ((Bool) -> ())
        ) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + (UserDefaults.standard.value(forKey: "token") as? String ?? "")
        ]
        
        Alamofire.request(
            ServerConfig.host("/auth/authenticated"),
            method: .get,
            headers: headers
            )
            .validate(statusCode: 200...200)
            .responseData { response in
                switch response.result {
                case .success:
                    callback(true)
                case .failure:
                    callback(false)
                }
        }
    }
    
}
