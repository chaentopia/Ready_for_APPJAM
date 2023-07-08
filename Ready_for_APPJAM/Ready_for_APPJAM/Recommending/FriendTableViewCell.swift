//
//  FriendTableViewCell.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/07/08.
//

import UIKit

import SnapKit
import Then

final class FriendTableViewCell: UITableViewCell {
    
    static let identifier = "FriendTableViewCell"
    
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let schoolLabel = UILabel()
    lazy var addButton = UIButton()
    var isTapped: Bool = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension FriendTableViewCell {
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
//            $0.image = UIImage(named: "chae")
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
            $0.textColor = .white
        }
        
        addButton.do {
            $0.setImage(UIImage(systemName: "circle"), for: .normal)
            $0.tintColor = .yellow
            $0.addTarget(self, action: #selector(changeAddButton), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(schoolLabel)
        contentView.addSubview(addButton)
        
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
        
        addButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(8)
            $0.width.height.equalTo(30)
            $0.centerY.equalToSuperview()
        }
    }
    
    func configureFriendCell(_ model: FriendModel) {
        nameLabel.text = model.name
        schoolLabel.text = model.school
        isTapped = model.isButtonSelected
        
        let imageName = isTapped ? "circle.fill" : "circle"
        addButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc private func changeAddButton() {
        isTapped.toggle()
        addButton.setImage(UIImage(systemName: "circle.fill"), for: .normal)
    }
}
