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
    
}

