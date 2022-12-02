//
//  ImageViewController.swift
//  Sample
//
//  Created by Reshmy Manuraj on 30/11/22.
//

import UIKit

public extension UIViewController{
       
    static func getStoryboardVC() -> UIStoryboard {
           let storyboard = UIStoryboard(name: "SampleImg", bundle: Bundle.module) // Use Bundle.module
           return storyboard
       }
}

public class ImageViewController: UIViewController {

   
    @IBOutlet weak var imgView: UIImageView!
   
    public override func viewDidLoad() {
    }
    
    @IBAction func apiCallBtnTapped(_ sender: Any) {
        APIRequest.sharedInstance.apiCall(request:"", parameters:[:], success: onAPISuccess, failure: onAPIFailed)
    }
    
    func onAPISuccess(response:Data?)
    {
        print("response:",response as Any)
        self.imgView.image = UIImage(data: response!)
        
    }

    
    func onAPIFailed(message: String)
    {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
