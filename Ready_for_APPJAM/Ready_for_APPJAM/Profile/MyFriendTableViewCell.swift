//
//  MyFriendTableViewCell.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/07/08.
//

import UIKit

import SnapKit
import Then

final class MyFriendTableViewCell: UITableViewCell {
    
    static let identifier = "MyFriendTableViewCell"
    
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let schoolLabel = UILabel()
//    var isTapped: Bool = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension MyFriendTableViewCell {
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        self.backgroundColor = .black
        
        separatorInset.left = 14
        separatorInset.right = 14
        selectionStyle = .default
        
        profileImageView.do {
            $0.image = UIImage(systemName: "circle.fill")
            $0.tintColor = .white
        }
        
        nameLabel.do {
            $0.font = .boldSystemFont(ofSize: 18)
            $0.setTextWithLineHeight(text: "정채은", lineHeight: 24)
            $0.textColor = .white
        }
        
        schoolLabel.do {
            $0.font = .systemFont(ofSize: 11)
            $0.setTextWithLineHeight(text: "이화여자대학교 융합콘텐츠학과 20학번", lineHeight: 15)
            $0.textColor = .gray
        }
    }
    
    private func setLayout() {
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(schoolLabel)
        
        profileImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(8)
            $0.width.height.equalTo(42)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(12)
        }
        
        schoolLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(nameLabel)
        }
    }
    
    func configureFriendCell(_ model: FriendModel) {
        nameLabel.text = model.name
        schoolLabel.text = model.school
//        isTapped = model.isButtonSelected
    }
}
