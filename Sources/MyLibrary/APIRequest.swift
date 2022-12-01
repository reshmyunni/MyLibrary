//
//  File.swift
//  
//
//  Created by Reshmy Manuraj on 01/12/22.
//

import Foundation
import UIKit

public class APIRequest:NSObject{
    
    static let sharedInstance = APIRequest()
    
    func apiCall()->UIImage{
        var image:UIImage?
        let api:NSURL = URL(string: "https://bit.ly/2LMtByx")! as NSURL
        
        let request = URLRequest(url: api as URL)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                image = UIImage(data: data)
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        
        task.resume()
        return image!
    }
}
