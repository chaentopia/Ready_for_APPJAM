//
//  EmptyFriendView.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/07/08.
//

import UIKit

import SnapKit
import Then

final class EmptyFriendView: UIView {
    
    private let containView = UIView()
    private let emptyImageView = UIImageView()
    private let emptyDescriptionLabel = UILabel()
    private lazy var inviteButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EmptyFriendView {
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        self.backgroundColor = .black
        emptyImageView.do {
            $0.image = UIImage(named: "banner_invite")
        }
        
        emptyDescriptionLabel.do {
            $0.setTextWithLineHeight(text: "지금 추천된 친구가 없어요!\n친구를 초대해볼까요?", lineHeight: 24)
            $0.numberOfLines = 2
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 16)
        }
        
        inviteButton.do {
            $0.setTitle("친구 초대하기", for: .normal)
            $0.setTitleColor(.yellow, for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
            $0.backgroundColor = .darkGray
        }
    }
    
    private func setLayout() {
        self.addSubview(containView)
        containView.addSubview(emptyImageView)
        containView.addSubview(emptyDescriptionLabel)
        containView.addSubview(inviteButton)
        
        self.snp.makeConstraints {
            $0.height.equalTo(483.adjustedHeight)
            $0.width.equalTo(375.adjustedWidth)
        }
        
        containView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(272.adjustedHeight)
            $0.width.equalTo(236.adjustedWidth)
        }
        
        emptyImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(130.adjusted)
        }
        
        emptyDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(emptyImageView.snp.bottom).offset(16.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        inviteButton.snp.makeConstraints {
            $0.top.equalTo(emptyDescriptionLabel.snp.bottom).offset(30.adjusted)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(236)
            $0.height.equalTo(48)
        }
    }
}
