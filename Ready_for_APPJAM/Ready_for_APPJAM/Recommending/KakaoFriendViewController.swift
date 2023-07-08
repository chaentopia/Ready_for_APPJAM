//
//  KakaoFriendViewController.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/07/06.
//

import UIKit

import SnapKit
import Then

final class KakaoFriendViewController: UIViewController {
    
    private let inviteBannerView = InviteBannerView()
    private let kakaoFriendView = KakaoFriendView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension KakaoFriendViewController {
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        view.backgroundColor = .black
    }
    
    private func setLayout() {
        view.addSubview(inviteBannerView)
        view.addSubview(kakaoFriendView)
        inviteBannerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(76)
        }
        
        kakaoFriendView.snp.makeConstraints {
            $0.top.equalTo(inviteBannerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
