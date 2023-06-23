//
//  ProfileViewController.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/06/23.
//

import UIKit

import SnapKit
import Then
import KakaoSDKUser


final class ProfileViewController: UIViewController {
    
    lazy var profileImage = UIImageView().then {
        $0.image = UIImage(systemName: "person.crop.circle")
        $0.tintColor = .gray
    }
    lazy var nameLabel = UILabel().then {
        $0.text = "이름"
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    lazy var logoutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.text = "로그아웃"
        $0.titleLabel?.font = .systemFont(ofSize: 20)
        $0.titleLabel?.textColor = .black
        $0.addTarget(self, action: #selector(LogoutAction), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}

extension ProfileViewController {
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubview(profileImage)
        view.addSubview(nameLabel)
        view.addSubview(logoutButton)
        
        profileImage.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-30)
            $0.width.height.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        logoutButton.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    @objc
    func LogoutAction(_ sender: Any) {
            UserApi.shared.logout{(error) in
                if let error = error {
                    print(error)
                } else {
                    print("kakao logout success")
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
}


