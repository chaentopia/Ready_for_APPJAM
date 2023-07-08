//
//  ProfileView.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/07/08.
//

import UIKit
import SnapKit
import Then

final class ProfileView: UIView {
    
    private let profileLabel = UILabel()
    private let myProfileView = MyProfileView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileView {
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        self.backgroundColor = .black
        profileLabel.do {
            $0.text = "프로필"
            $0.textColor = .white
            $0.font = .boldSystemFont(ofSize: 20)
        }
    }
    
    private func setLayout() {
        self.addSubview(profileLabel)
        self.addSubview(myProfileView)
        
        profileLabel.snp.makeConstraints {
            let statusBarHeight = UIApplication.shared.connectedScenes
                        .compactMap { $0 as? UIWindowScene }
                        .first?
                        .statusBarManager?
                        .statusBarFrame.height ?? 20
            
            $0.top.equalTo(self.safeAreaInsets).offset(statusBarHeight + 22.adjusted)
            $0.leading.equalToSuperview().offset(16.adjusted)
        }
        
        myProfileView.snp.makeConstraints {
            $0.top.equalTo(profileLabel.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(230)
        }
    }
}
