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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    // button controll
    @IBAction func clickStartBtn(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "scr_onb_call") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    @IBAction func clickNextBtn1(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "scr_onb_safe") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    @IBAction func clickNextBtn2(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "scr_onb_women") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    @IBAction func clickNextBtn3(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "scr_onb_access") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    @IBAction func clickNextBtn4(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "scr_onb_notice") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }

    @IBAction func click_scr_signup_terms_main_btn(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "scr_start_main") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }

    @IBAction func click_scr_start_main_btn(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "scr_start_profile") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }

    @IBAction func click_scr_start_profile_btn(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "scr_start_NOK") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }

    @IBAction func click_scr_start_NOK_btn(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "scr_start_name") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }

    @IBAction func click_scr_start_name_btn(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "scr_start_locpermit") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    
    @IBAction func stopCallPopup(_ sender: UIButton) {
        let alert = UIAlertController(title: "통화를 종료할까요?", message: "안내 상세 텍스트", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "cancel", style: .default, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(cancel)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
    }

    
    // https://zeddios.tistory.com/111
    @IBAction func clickPopup(_ sender: UIButton) {
        let alert = UIAlertController(title: "유저를 신고할까요?", message: "안내 상세 텍스트", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "cancel", style: .default, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(cancel)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
//    func setupProviderLoginView() {
//        let authorizationButton = ASAuthorizationAppleIDButton()
//            authorizationButton.addTarget(self, action: #selector(clickAppleLoginBtn), for: .touchUpInside)
//            self.loginProviderStackView.addArrangedSubview(authorizationButton)
//          }
//    }

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
