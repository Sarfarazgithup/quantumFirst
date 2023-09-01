//
//  LandingViewController.swift
//  QuantumInnovationDemo
//
//  Created by Sarfaraz Ali on 01/09/23.
//

import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkLogIn()
    }
   

    
    func checkLogIn() {
        if let  userLogIn = UserDefaults.standard.object(forKey: "userLogIn"),userLogIn as! Bool {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    

}


