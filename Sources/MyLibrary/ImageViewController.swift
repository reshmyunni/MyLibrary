//
//  ImageViewController.swift
//  Sample
//
//  Created by Reshmy Manuraj on 30/11/22.
//

import UIKit

public extension UIViewController{
       
    static func getStoryboardVC() -> UIViewController {
           let storyboard = UIStoryboard(name: "ImageVC", bundle: Bundle.module) // Use Bundle.module
           return storyboard.instantiateInitialViewController()!
       }
}
public class ImageViewController: UIViewController {

    public override func viewDidLoad() {
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
