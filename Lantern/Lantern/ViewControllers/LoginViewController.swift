//import UIKit
//import KakaoSDKUser
//import AuthenticationServices
//
//class LogoutViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    
//}
//
//extension LogoutViewController {
//    ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
//    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//        return self.view.window!
//    }
//        
//    private func getUserInfo() {
//        // 사용자 정보 가져오기
//        UserApi.shared.me() {(user, error) in
//            if let error = error {
//                print(error)
//            }
//        }
//    }
//}
