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
    
    @IBOutlet weak var loginStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupProviderLoginView()
        
        let leftSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
            let rightSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
                
            leftSwipeGestureRecognizer.direction = .left
            rightSwipeGestureRecognizer.direction = .right

            view.addGestureRecognizer(leftSwipeGestureRecognizer)
            view.addGestureRecognizer(rightSwipeGestureRecognizer)

    }
    
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        if (sender.direction == .left) {
            NSLog("Swipe Left")
        }
            
        if (sender.direction == .right) {
            NSLog("Swipe Right")
        }
    }
    // https://seungchan.tistory.com/entry/Swift-%EC%B9%B4%EC%B9%B4%EC%98%A4-%EC%86%8C%EC%85%9C-%EB%A1%9C%EA%B7%B8%EC%9D%B8
    @IBAction func kakaoLoginBtn(_ sender: UIButton) {
        // 카카오톡 설치여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                }
            }
        }
        
        // 웹뷰로 로그인
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")

                //do something
                let _ = oauthToken
            }
        }
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
    
    // https://nsios.tistory.com/40
    // https://twih1203.medium.com/애플-로그인-구현하기-2-c5ce5ada2b1f
    func setupProviderLoginView() {
        let appleButton = ASAuthorizationAppleIDButton(type: .signIn, style: .black)
        // addTarget으로 누를 때 실행할 동작 설정
        appleButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
        // addSubview로 애플 로그인 버튼 -> 미리 만든 loginStackView에 추가
        self.loginStackView.addSubview(appleButton)
        
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        appleButton.leadingAnchor.constraint(equalTo: loginStackView.leadingAnchor).isActive = true
        appleButton.trailingAnchor.constraint(equalTo: loginStackView.trailingAnchor).isActive = true
        appleButton.topAnchor.constraint(equalTo: loginStackView.topAnchor).isActive = true
        appleButton.bottomAnchor.constraint(equalTo: loginStackView.bottomAnchor).isActive = true
    }
    
    // 버튼 누를 때 수행되는 핸들러
    @objc func handleAuthorizationAppleIDButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
}

extension ViewController:
    ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
