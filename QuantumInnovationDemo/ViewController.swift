//
//  ViewController.swift
//  QuantumInnovationDemo
//
//  Created by Sarfaraz Ali on 31/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    
    @IBOutlet weak var lblLogin: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblPassword: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func actionLogIn(_ sender: UIButton) {
       
        var email = txtEmail.text ?? ""
        var password = txtPassword.text ?? ""
        
        if(!email.isValidEmail()) {
            showToast(message: "Please enter valide Email")
            return
        }
        let passwordRequirements = """
        Please enter a valid password with the following criteria:
        - At least 6 characters long.
        - Contains at least one uppercase letter.
        - Contains at least one lowercase letter.
        - Contains at least one digit (0-9).
        """
        let isUserLogIn:Bool = true
        UserDefaults.standard.set(isUserLogIn, forKey: "userLogIn")
        if(!password.isPasswordValid()) {
            showToast(message: passwordRequirements,textAlignment: .left)
            return
        }
           

        let vc = storyboard?.instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}





