//
//  ViewController.swift
//  Lantern
//
//  Created by suhseungju on 2023/03/01.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func clickStartBtn(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "OnBoarding2") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    
    @IBAction func clickNextBtn1(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "OnBoarding3") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    @IBAction func clickNextBtn2(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "OnBoarding3") else {return}
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    
    
}

