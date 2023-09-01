//
//  Extention.swift
//  QuantumInnovationDemo
//
//  Created by Sarfaraz Ali on 31/08/23.
//

import Foundation

import UIKit
extension String{
    func isValidEmail() -> Bool {
        let emailRegEx = #"^\S+@\S+\.\S+$"#

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    func isPasswordValid() -> Bool{
        let password = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{6,}$"
        let Password = NSPredicate(format: "SELF MATCHES %@", password)
        return Password.evaluate(with: self)
    }
}

extension UIViewController {
    func showToast(message: String, textAlignment: NSTextAlignment = .center) {
        let toastView = ToastView(frame: CGRect(x: 0, y: 0, width: 350, height: 50))
        toastView.center = view.center
        toastView.setMessage(message,textAlignment: textAlignment)

        view.addSubview(toastView)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            toastView.removeFromSuperview()
        }
    }
}
