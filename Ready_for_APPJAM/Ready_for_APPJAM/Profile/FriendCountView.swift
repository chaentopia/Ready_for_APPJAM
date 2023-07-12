//
//  FriendCountView.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/07/09.
//

import UIKit

import SnapKit
import Then

final class FriendCountView: UIView {

    private let myFriendLabel = UILabel()
    private let friendNumberLabel = UILabel()
    private let friendCountLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FriendCountView {
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        myFriendLabel.do {
            $0.setTextWithLineHeight(text: "내 친구들", lineHeight: 22)
            $0.font = .boldSystemFont(ofSize: 16)
            $0.textColor = .white
        }
        
        friendNumberLabel.do {
            $0.setTextWithLineHeight(text: "친구 수", lineHeight: 16)
            $0.font = .boldSystemFont(ofSize: 12)
            $0.textColor = .gray
        }
        
        friendCountLabel.do {
            $0.setTextWithLineHeight(text: "95명", lineHeight: 16)
            $0.font = .boldSystemFont(ofSize: 12)
            $0.textColor = .white
        }
    }
    
    private func setLayout() {
        self.addSubview(myFriendLabel)
        self.addSubview(friendNumberLabel)
        self.addSubview(friendCountLabel)
        
        self.snp.makeConstraints {
            $0.height.equalTo(22)
            $0.width.equalTo(343)
        }
        
        myFriendLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        friendNumberLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.trailing.equalTo(friendCountLabel.snp.leading).offset(-4)
        }
        
        friendCountLabel.snp.makeConstraints {
            $0.top.equalTo(friendNumberLabel)
            $0.trailing.equalToSuperview()
        }
    }
}
