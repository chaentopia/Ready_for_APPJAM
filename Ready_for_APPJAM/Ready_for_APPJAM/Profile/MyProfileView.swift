//
//  MyProfileView.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/07/08.
//

import UIKit

import SnapKit
import Then

final class MyProfileView: UIView {
    
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let instagramLabel = UILabel()
    private let schoolLabel = UILabel()
    private let separateView = UIView()
    private let messageView = CountCustomView()
    private let friendView = CountCustomView()
    private let pointView = CountCustomView()
    private let addGroupButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyProfileView {
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        self.backgroundColor = .darkGray
        self.layer.cornerRadius = 12
        
        profileImageView.do {
            $0.image = UIImage(named: "basic")
        }
        
        nameLabel.do {
            $0.setTextWithLineHeight(text: "정채은", lineHeight: 30)
            $0.font = .boldSystemFont(ofSize: 21)
            $0.textColor = .white
        }
        
        instagramLabel.do {
            $0.setTextWithLineHeight(text: "@chaentopia", lineHeight: 20)
            $0.font = .boldSystemFont(ofSize: 13)
            $0.textColor = .yellow
        }
        
        schoolLabel.do {
            $0.setTextWithLineHeight(text: "이화여자대학교 융합콘텐츠학과 20학번", lineHeight: 16)
            $0.font = .boldSystemFont(ofSize: 12)
            $0.textColor = .gray
        }
        
        separateView.do {
            $0.backgroundColor = .gray
        }
        
        messageView.do {
            $0.countLabel.text = "9"
            $0.titleLabel.text = "받은 쪽지"
        }
        
        friendView.do {
            $0.countLabel.text = "43"
            $0.titleLabel.text = "내 친구 수"
        }
        
        pointView.do {
            $0.countLabel.text = "940"
            $0.titleLabel.text = "내 포인트"
        }
        
        addGroupButton.do {
            $0.backgroundColor = .gray
            $0.layer.cornerRadius = 8
            $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
            $0.setTitleColor(.yellow, for: .normal)
            $0.tintColor = .yellow
            $0.setImage(UIImage(systemName: "plus"), for: .normal)
            $0.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 4)
            $0.setTitle("그룹 추가", for: .normal)
        }
        
    }
    
    private func setLayout() {
        self.addSubview(profileImageView)
        self.addSubview(nameLabel)
        self.addSubview(instagramLabel)
        self.addSubview(schoolLabel)
        self.addSubview(separateView)
        self.addSubview(messageView)
        self.addSubview(friendView)
        self.addSubview(pointView)
        self.addSubview(addGroupButton)
        
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(28)
            $0.width.height.equalTo(48)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(12)
        }
        
        instagramLabel.snp.makeConstraints {
            $0.bottom.equalTo(nameLabel).inset(3)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(8)
        }
        
        schoolLabel.snp.makeConstraints {
            $0.bottom.equalTo(profileImageView)
            $0.leading.equalTo(nameLabel)
        }
        
        separateView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(16)
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview().inset(32)
        }
        
        messageView.snp.makeConstraints {
            $0.top.equalTo(separateView.snp.bottom).offset(4)
            $0.trailing.equalTo(friendView.snp.leading).offset(-12)
        }
        
        friendView.snp.makeConstraints {
            $0.top.equalTo(messageView)
            $0.centerX.equalToSuperview()
        }
        
        pointView.snp.makeConstraints {
            $0.top.equalTo(messageView)
            $0.leading.equalTo(friendView.snp.trailing).offset(12)
        }
        
        addGroupButton.snp.makeConstraints {
            $0.top.equalTo(messageView.snp.bottom).offset(10)
            $0.height.equalTo(48)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
    }
}
