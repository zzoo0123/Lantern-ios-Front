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
import CoreLocation

class ViewController: UIViewController {
    let userNotificationCenter = UNUserNotificationCenter.current()
    var locationManager:CLLocationManager!
    
    @IBOutlet weak var loginStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        setupProviderLoginView()
        
        userNotificationCenter.delegate = self
        
        requestNotificationAuthorization()
        sendNotification(seconds: 10)
        
        locationManager.delegate = self
        
        
        let leftSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
                
        leftSwipeGestureRecognizer.direction = .left
        rightSwipeGestureRecognizer.direction = .right

        view.addGestureRecognizer(leftSwipeGestureRecognizer)
        view.addGestureRecognizer(rightSwipeGestureRecognizer)

    }
    
    // https://thoonk.tistory.com/15
    // https://zeddios.tistory.com/157
    // https://onelife2live.tistory.com/33
    func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)

        userNotificationCenter.requestAuthorization(options: authOptions) { success, error in
            if let error = error {
                print("Error: \(error)")
            }
        }
    }
    
    func sendNotification(seconds: Double) {
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = "랜턴 알림 테스트"
        notificationContent.body = "알림 테스트 하는 중입니다"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: "testNotification", content: notificationContent, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }
    
    func checkUserDeviceLocationServiceAuthorization() {
        
        let authorizationStatus: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            
            authorizationStatus = locationManager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        
        //iOS 위치 서비스 활성화 여부 체크
        if CLLocationManager.locationServicesEnabled() {
            checkUserCurrentLocationAuthorization(authorizationStatus)
        } else {
            print("위치서비스가 꺼져 있어서 위치 권한 요청을 못합니다.")
        }
        
    }
    
    func checkUserCurrentLocationAuthorization(_ authorizationStatus: CLAuthorizationStatus) {
            switch authorizationStatus {
            case .notDetermined:
                print("NOTDETERMINED")
                
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.requestWhenInUseAuthorization()
                
            case .restricted, .denied:
                print("DENIED, 아이폰 설정으로 유도")
                
            case .authorizedWhenInUse:
                print("WHEN IN USE")
                locationManager.startUpdatingLocation()
            default: print("DEFAULT")
            }
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
    // https://gyuios.tistory.com/81
    @IBAction func kakaoLoginBtn(_ sender: UIButton) {
        // 카카오톡으로 로그인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "scr_signup_terms_main") else {return}
                    nextVC.modalPresentationStyle = .fullScreen
                    self.present(nextVC, animated: true)
                    //do something
                    _ = oauthToken
                }
            }
        }
        
        // 카카오계정으로 로그인
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                //do something
                _ = oauthToken
            }
        }
    }
    
    @IBAction func notificationBtn(_ sender: UIButton) {
//        requestNotificationPermission()
//        registerForPushNotifications()
    }
    
    // button controll
    @IBAction func clickStartBtn(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "scr_onb_call") else {return}
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

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([. alert, .badge, .sound])
    }
}

// https://callmedaniel.tistory.com/m/62
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("사용자의 위치를 성공적으로 가져왔습니다.")
        print(locations)
        
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("사용자의 위치를 가져오지 못했습니다.")
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("사용자가 권한 상태를 바꿨습니다.")
        checkUserDeviceLocationServiceAuthorization()
    }
}



