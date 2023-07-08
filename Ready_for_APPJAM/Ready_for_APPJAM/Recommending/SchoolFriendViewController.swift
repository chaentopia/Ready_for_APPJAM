//
//  SchoolFriendViewController.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/07/06.
//

import UIKit

import UIKit

import SnapKit
import Then

final class SchoolFriendViewController: UIViewController {
    
    private let inviteBannerView = InviteBannerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension SchoolFriendViewController {
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        view.backgroundColor = .black
    }
    
    private func setLayout() {
        view.addSubview(inviteBannerView)
        inviteBannerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(76)
        }
    }
}