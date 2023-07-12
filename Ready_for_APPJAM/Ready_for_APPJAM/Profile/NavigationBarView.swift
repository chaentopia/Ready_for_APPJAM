//
//  NavigationBarView.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/07/09.
//

import UIKit

import SnapKit
import Then

final class NavigationBarView: UIView {
    
    private let profileLabel = UILabel()
    private lazy var settingButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NavigationBarView {
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
        
        settingButton.do {
            $0.setTitle("관리", for: .normal)
            $0.setTitleColor(.gray, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 12)
        }
    }
    
    private func setLayout() {
        self.addSubview(profileLabel)
        self.addSubview(settingButton)
        
        let statusBarHeight = UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .first?
                    .statusBarManager?
                    .statusBarFrame.height ?? 20
        
        profileLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16.adjusted)
        }
        
        settingButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
            $0.width.equalTo(33)
            $0.height.equalTo(28)
        }
    }
}
