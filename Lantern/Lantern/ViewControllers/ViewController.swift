//
//  ViewController.swift
//  Lantern
//
//  Created by suhseungju on 2023/03/01.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import AuthenticationServices

class ViewController: UIViewController {
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var nextBtn1: UIButton!
    @IBOutlet weak var nextBtn2: UIButton!
    @IBOutlet weak var nextBtn3: UIButton!
    @IBOutlet weak var nextBtn4: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // button controll
    @IBAction func clickStartBtn(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "OnBoarding2") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    @IBAction func clickNextBtn1(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "OnBoarding3") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    @IBAction func clickNextBtn2(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "OnBoarding4") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    @IBAction func clickNextBtn3(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "OnBoarding5") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    @IBAction func clickNextBtn4(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SocialLogin") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    
//    func setupProviderLoginView() {
//        let authorizationButton = ASAuthorizationAppleIDButton()
//            authorizationButton.addTarget(self, action: #selector(clickAppleLoginBtn), for: .touchUpInside)
//            self.loginProviderStackView.addArrangedSubview(authorizationButton)
//          }
//    }
//
//
////    @objc
//    func clickAppleLoginBtn() {
//        let appleIDProvider = ASAuthorizationAppleIDProvider()
//        let request = appleIDProvider.createRequest()
//        request.requestedScopes = [.fullName, .email]
//
//        let controller = ASAuthorizationController(authorizationRequests: [request])
//        controller.delegate = self
//        controller.presentationContextProvider = self as? ASAuthorizationControllerPresentationContextProviding
//        controller.performRequests()
//    }

//
//    // kakao 로그인 토큰 발행
//    func kakaoLogin() {
//        if (UserApi.isKakaoTalkLoginAvailable()) {
//            // 카카오톡이 설치되어있는지 확인
//            UserApi.shared.loginWithKakaoTalk{(oauthToken, error) in
//                if let error = error {
//                    print(error)
//                } else {
//                    print("login with KakaoTalk success")
//                    // do something
//                    _ = oauthToken
//                }
//            }
//
//            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
//                if let error = error {
//                    print(error)
//                } else {
//                    print("loginWithKakaoTalk() success.")
//                    //do something
//                    _ = oauthToken
//                }
//            }
//        }
}

//extension ViewController: ASAuthorizationControllerDelegate {
//    // 성공 후 동작
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//            if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
//
//                let idToken = credential.identityToken!
//                let tokeStr = String(data: idToken, encoding: .utf8)
//                print(tokeStr)
//
//                guard let code = credential.authorizationCode else { return }
//                let codeStr = String(data: code, encoding: .utf8)
//                print(codeStr)
//
//                let user = credential.user
//                print(user)
//
//            }
//        }
//
//    // 실패 후 동작
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
//            print("error")
//    }
//}
