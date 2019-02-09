//
//  ProfileAPI.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 07/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import Alamofire

class ProfileAPI {
    // Get Profile
    // ---------------------------------------------------------------------------------------------
    static func getProfile(
        callback: @escaping ((ProfileAPIProfileModel) -> ())
        ) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + (UserDefaults.standard.value(forKey: "token") as? String ?? "")
        ]
        
        Alamofire.request(
            ServerConfig.host("/user/account"),
            method: .get,
            headers: headers
            )
            .responseJSON { response in
                
                if let data = response.data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let resdata = try jsonDecoder.decode(ProfileAPIProfileModel.self, from: data)
                        
                        callback(resdata)
                    } catch {
                        // print(error)
                        Utilities.viewAlert(title: "Authorization Error", message: "Username/E-mail or password is wrong.")
                    }
                }
        }
    }
    
    
    // Save profile
    // ---------------------------------------------------------------------------------------------
    static func saveProfile(
        name: String,
        username: String,
        email: String,
        callback: @escaping ((Bool) -> ())
        ) {
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + (UserDefaults.standard.value(forKey: "token") as? String ?? "")
        ]
        
        let oldName = (ProfileEditModel.cells[0] as! UICellTitleInput).getOriginalValue();
        let oldUsername = (ProfileEditModel.cells[2] as! UICellTitleInput).getOriginalValue();
        let oldEmail = (ProfileEditModel.cells[4] as! UICellTitleInput).getOriginalValue();
        
        var params: Parameters = [:];
        if(name != oldName) {
            params["name"] = name
        }
        if(username != oldUsername) {
            params["username"] = username
        }
        if(email != oldEmail) {
            params["email"] = email
        }
        
        Alamofire.request(
            ServerConfig.host("/user/account"),
            method: .patch,
            parameters: params,
            encoding: JSONEncoding.default,
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
    
    
    // Patch password
    // ---------------------------------------------------------------------------------------------
    static func patchPassword(
        oldPassword: String,
        newPassword: String,
        repeatPassword: String,
        callback: @escaping ((Bool) -> ())
        ) {
        
        if (repeatPassword != newPassword) {
            callback(false)
            return
        }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + (UserDefaults.standard.value(forKey: "token") as? String ?? "")
        ]
        
        Alamofire.request(
            ServerConfig.host("/user/account/password"),
            method: .patch,
            parameters: [
                "old_password": oldPassword,
                "new_password": newPassword,
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
                    callback(false)
                }
        }
    }
}
