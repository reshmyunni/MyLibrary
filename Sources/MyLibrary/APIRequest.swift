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
    
    func apiCall(request: String, parameters: [String: String], success: @escaping (Data?) -> Void, failure: @escaping (String) -> Void){
        let url = URL(string: "https://bit.ly/2LMtByx"+request)
        print("url:",url as Any)
        guard let requestUrl = url else { fatalError() }
        
//        let task = URLSession.shared.dataTask(with: requestUrl) { (data, response, error) in
//
//            if error != nil {
//                DispatchQueue.main.async{failure("Unable to reach our servers. Please check your network connection and Retry.")}
//                    return
//                }
//
//                if let data = data, let dataString = String(data: data, encoding: .utf8) {
//                    let data: Data? = dataString.data(using: .utf8)
//                    if let json = (try? JSONSerialization.jsonObject(with: data!, options: [])) as? [String:Any]
//                    {
//
//                            DispatchQueue.main.async{success(json)}
//                    }
//                    else
//                    {
//                        DispatchQueue.main.async{failure("Unable to reach our servers. Please Retry.")}
//                    }
//                }
//                else
//                {
//                    DispatchQueue.main.async{failure("Unable to reach our servers. Please Retry.")}
//                }
//        }
        let task = URLSession.shared.dataTask(with: requestUrl) { data, response, error in

            // ensure there is no error for this HTTP response
            guard error == nil else {
                print ("error: \(error!)")
                return
            }
            
            // ensure there is data returned from this HTTP response
            guard let content = data else {
                print("No data")
                return
            }
            
            // serialise the data / NSData object into Dictionary [String : Any]
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                print("Not containing JSON")
                DispatchQueue.main.async{success(data)}
                return
            }
            
            print("gotten json response dictionary is \n \(json)")
            // update UI using the response here
        }

        
        task.resume()
    }
}
