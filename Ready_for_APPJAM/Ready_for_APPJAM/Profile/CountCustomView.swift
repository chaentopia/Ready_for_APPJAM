//
//  CountCustomView.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/07/08.
//

import UIKit

import SnapKit
import Then

final class CountCustomView: UIView {
    
    var countLabel = UILabel()
    var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CountCustomView {
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        countLabel.do {
            $0.setTextWithLineHeight(text: "0", lineHeight: 30)
            $0.font = .boldSystemFont(ofSize: 21)
            $0.textColor = .white
        }
        
        titleLabel.do {
            $0.setTextWithLineHeight(text: "받은 쪽지", lineHeight: 15)
            $0.font = .boldSystemFont(ofSize: 11)
            $0.textColor = .gray
        }
        
    }
    
    private func setLayout() {
        self.addSubview(countLabel)
        self.addSubview(titleLabel)
        
        self.snp.makeConstraints {
            $0.height.equalTo(64)
            $0.width.equalTo(84)
        }
        
        countLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(9)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(countLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
    }
}
