//
//  ItemViewController.swift
//  QuantumInnovationDemo
//
//  Created by Sarfaraz Ali on 31/08/23.
//

import UIKit
import Alamofire
import SDWebImage

class ItemViewController: UIViewController {
    let defaults = UserDefaults.standard
    let dataSaveKey = "article"
    var userArray : [Article] = []
    @IBOutlet weak var myTableView: UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        getDataNews()
        print("Hello")
       
      
    
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
    }
    
    
    
    func getDataNews() {
        AF.request("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=522105953cc4493f93b6318f5cf648c0", encoding:JSONEncoding.default).cURLDescription{print($0)}.responseJSON { [weak self] response in
            
            print("->>>",response)
            if let  jsonData = response.data {
                // let jsonData = response.data(using: .utf8)!
                let user = try! JSONDecoder().decode(UserResponseModel.self, from: jsonData)
               print("user->>>",user.articles)
//              self?.defaults.set(user.articles, forKey: self?.dataSaveKey ?? "")
                self?.userArray = user.articles
//                print("user Array->>>",arr)
                self?.myTableView.reloadData()
            }
           
        }
    }
   

   
}

extension ItemViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = myTableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserCell
       
        cell.firstLbl.text = userArray[indexPath.row].title
        cell.SecondLbl.text = "the Vergh    \(userArray[indexPath.row].publishedAt ?? "")"
        DispatchQueue.main.async { [self] in
            cell.userImage.sd_setImage(with: URL(string: userArray[indexPath.row].urlToImage ?? ""))
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ssr")
        let vc = storyboard?.instantiateViewController(withIdentifier: "DaitalItemViewController") as! DaitalItemViewController
        vc.secondName = userArray[indexPath.row].publishedAt ?? ""
        vc.firstName = userArray[indexPath.row].title ?? ""
       
        vc.ImageUrl = userArray[indexPath.row].urlToImage ?? ""

       navigationController?.pushViewController(vc, animated: true)
        
    }
}
