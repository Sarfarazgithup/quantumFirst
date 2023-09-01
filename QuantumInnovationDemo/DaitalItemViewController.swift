//
//  DaitalItemViewController.swift
//  QuantumInnovationDemo
//
//  Created by Sarfaraz Ali on 31/08/23.
//

import UIKit
import SDWebImage
class DaitalItemViewController: UIViewController {
    var userArray : [Article] = []
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var Lblfirst: UILabel!
    
    @IBOutlet weak var LblSecond: UILabel!
    var firstName = ""
    var secondName = ""
    var ImageUrl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationController?.isNavigationBarHidden = true
        LblSecond.text = "the Vergh" + "   " + secondName
        Lblfirst.text = firstName
       
                DispatchQueue.main.async { [self] in
                    image.sd_setImage(with: URL(string: ImageUrl))
                }

    }
    

    @IBAction func BackBtn(_ sender: Any) {
        print("hgsafhsgfhsf ali")
        navigationController?.popViewController(animated: true)
    }
    

}
