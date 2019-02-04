//
//  Utilities.swift
//  EvoDoc
//
//  Created by Sergey Dunaevskiy on 03/02/2019.
//  Copyright © 2019 evodoc. All rights reserved.
//

import UIKit

class Utilities {
    // ---------------------------------------------------------------------------------------------
    // Rotation
    // ---------------------------------------------------------------------------------------------
    static func rotationEnable() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        appDelegate.enableRotation = true;
    }
    
    static func rotationDisable() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        appDelegate.enableRotation = false;
        let value = UIInterfaceOrientation.portrait.rawValue;
        UIDevice.current.setValue(value, forKey: "orientation");
    }
    
    // ---------------------------------------------------------------------------------------------
    // Popup
    // ---------------------------------------------------------------------------------------------
    static func viewAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title, message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in }
        alertController.addAction(OKAction)
        
        let viewController = UIApplication.shared.keyWindow!.rootViewController
        viewController?.present(alertController, animated: true)
    }
}
