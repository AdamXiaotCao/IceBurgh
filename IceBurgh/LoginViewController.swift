//
//  LoginViewController.swift
//  IceBurgh
//
//  Created by XiaotianCao on 10/5/15.
//  Copyright © 2015 Adam Cao. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonHandler(sender: AnyObject) {
        let permission = [ "user_about_me"]
        PFFacebookUtils.logInWithPermissions(permission) { (user, error) -> Void in
            if (user == nil){
                var errorMessage = "";
                if(error == nil){
                    print("user cancels login")
                    errorMessage = "user cancels login"
                }else{
                    print("an error occured")
                    errorMessage = (error?.localizedDescription)!
                    
                }
                print(error)
                let alert = UIAlertView.init(title: "Error", message: errorMessage, delegate: nil, cancelButtonTitle: nil, otherButtonTitles: "Dismiss");
                alert.show()
            
            }else{
                if((user!.isNew)){
                    print("user with facebook signed up and logged in")
                }else{
                    print("user with facebook loggin")
                }
                self.performSegueWithIdentifier("toUserDetail", sender: sender)
            }
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
