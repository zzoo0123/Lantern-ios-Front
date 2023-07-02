import UIKit
import KakaoSDKUser

class LogoutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func kakaoLogoutBtn(_ sender: Any) {
        // 로그아웃
        UserApi.shared.logout{(error) in
            if let error = error {
                print(error)
            }
            else {
                print("kakao logout() success")
                
                // 로그아웃 -> 스플래쉬 페이지
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    @IBAction func unlinkClicked(_ sender: Any) {
        // 연결 끊기 : 연결 끊어지면 기존의 토큰은 더 이상 사용X, 연결 끊기 API 요청 성공 -> 로그아웃 처리가 함께 이뤄져 토큰 삭제
        UserApi.shared.unlink{(error) in
            if let error = error {
                print(error)
            }
            else {
                print("kakao unlink() success")
                
                // 연결끊기 -> 스플래쉬 페이지
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
