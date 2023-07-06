//
//  InviteBannerView.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/07/06.
//

import UIKit

import SnapKit
import Then

final class InviteBannerView: UIView {
    
    private let inviteImageView = UIImageView()
    private let inviteLabel = UILabel()
    private let descriptionLabel = UILabel()
    private lazy var nextButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InviteBannerView {
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        inviteImageView.do {
            $0.image = UIImage(systemName: "circle.fill")
            $0.tintColor = .white
        }
        
        inviteLabel.do {
            $0.setTextWithLineHeight(text: "친구 초대하기", lineHeight: 22)
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = .white
        }
        
        descriptionLabel.do {
            $0.font = .systemFont(ofSize: 11)
            $0.setTextWithLineHeight(text: "찾는 친구가 없다면 친구를 초대해 보세요!", lineHeight: 15)
            $0.textColor = .gray
        }
        
        nextButton.do {
            $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            $0.tintColor = .white
        }
    }
    
    private func setLayout() {
        self.addSubview(inviteImageView)
        self.addSubview(inviteLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(nextButton)
        
        inviteImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.width.height.equalTo(42)
            $0.centerY.equalToSuperview()
        }
        
        inviteLabel.snp.makeConstraints {
            $0.leading.equalTo(inviteImageView.snp.trailing).offset(12)
            $0.top.equalToSuperview().offset(18)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(inviteLabel)
            $0.top.equalTo(inviteLabel.snp.bottom).offset(2)
        }
        
        nextButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(8)
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
        }
    }

}

extension UILabel {
    func setTextWithLineHeight(text: String?, lineHeight: CGFloat) {
        if let text = text {
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = lineHeight
            style.minimumLineHeight = lineHeight
            
            let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: style,
            .baselineOffset: (lineHeight - font.lineHeight) * 0.26
            ]
                
            let attrString = NSAttributedString(string: text,
                                                attributes: attributes)
            self.attributedText = attrString
            self.textAlignment = .center
            self.numberOfLines = 2
        }
    }
}
