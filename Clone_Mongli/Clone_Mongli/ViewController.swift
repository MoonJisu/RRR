//
//  ViewController.swift
//  Clone_Mongli
//
//  Created by 문지수 on 2020/06/27.
//  Copyright © 2020 문지수. All rights reserved.
//

import UIKit
import AuthenticationServices
import SnapKit
import Alamofire

class ViewController: UIViewController, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    let appleLoginVtn = ASAuthorizationAppleIDButton(type: .signIn, style: .white)
    
    var request = URLRequest(url: URL(string: "https://mongli.site/api/")!)
    request.httpMethod = "GET"
    
    func setUpProviderLoginView() {
        appleLoginVtn.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
        self.view.addSubview(appleLoginVtn)
    }
    
    @objc
    func handleAuthorizationAppleIDButtonPress() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
    func setUpConstraints(){
        self.appleLoginVtn.snp.makeConstraints {
            $0.width.equalTo(340)
            $0.height.equalTo(40)
            $0.center.equalToSuperview()
        }
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
      return self.view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization .credential as?
            ASAuthorizationAppleIDCredential{
            let userIdentifire = credential.user
            let fullname = credential.fullName
            let email = credential.email
            
            print(userIdentifire, fullname, email, separator: "\n")
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.startPoint = CGPoint(x:0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x:0.5, y: 1.0)
        gradientLayer.locations = [0.0, 1.0]

        gradientLayer.colors =
            [UIColor(hex: 0xA8C9FF, alpha: 1.0).cgColor,
             UIColor(hex: 0x3F2B96, alpha: 1.0).cgColor]


        gradientLayer.shouldRasterize = true
        self.view.layer.addSublayer(gradientLayer)
        
        setUpProviderLoginView()
        setUpConstraints()
        }
    }

extension UIColor {
           convenience init(hex: UInt, alpha: CGFloat) {
               self.init(
                   red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                   green: CGFloat((hex & 0x00ff00) >> 8) / 255.0,
                   blue: CGFloat(hex & 0x0000FF) / 255.0,
                   alpha: alpha
               )
           }
       }

//extension ViewController: ASAuthorizationControllerPresentationContextProviding {
//    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//
//    }
//}

