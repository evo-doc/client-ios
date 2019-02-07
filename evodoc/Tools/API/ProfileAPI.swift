//
//  ProfileAPI.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 07/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import Alamofire

struct ProfileAPIGetProfileSuccessModel: Codable {
    var avatar: String;
    var email: String;
    var name: String?;
    var username: String;
}


class ProfileAPI {
    // Get Profile
    // ---------------------------------------------------------------------------------------------
    static func getProfile(
        callback: @escaping ((ProfileAPIGetProfileSuccessModel) -> ())
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
                        let resdata = try jsonDecoder.decode(ProfileAPIGetProfileSuccessModel.self, from: data)
                        
                        callback(resdata)
                    } catch {
                        // print(error)
                        Utilities.viewAlert(title: "Authorization Error", message: "Username/E-mail or password is wrong.")
                    }
                }
        }
    }
}
