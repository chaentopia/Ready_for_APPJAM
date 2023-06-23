//
//  LoginViewController.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/06/23.
//

import UIKit

import SnapKit
import Then
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon

final class LoginViewController: UIViewController {
    
    lazy var kakaoLoginButton = UIButton().then {
        $0.setImage(UIImage(named:"kakao_login_medium_wide"), for: .normal)
        $0.addTarget(self, action: #selector (touchUpToConnectKakaotalk), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        
    }
    
}

extension LoginViewController {
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubview(kakaoLoginButton)
        
        kakaoLoginButton.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
    
    @objc func touchUpToConnectKakaotalk(_ sender: UIButton) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                    
                    self.setUserInfo()
                }
            }
        }
    }
    
    func setUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            } else if let profileImageUrl = user?.kakaoAccount?.profile?.profileImageUrl {
                let profileViewController = ProfileViewController()
                profileViewController.profileImage.kf.setImage(with: profileImageUrl)
                profileViewController.nameLabel.text = user?.kakaoAccount?.profile?.nickname ?? "no nickname"
            
                self.navigationController?.pushViewController(profileViewController, animated: true)
                self.navigationController?.navigationBar.isHidden = true
                print("me() success")
            }
        }
    }
}
