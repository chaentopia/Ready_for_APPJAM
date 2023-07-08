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
    
    private let kakaoFriendView = KakaoFriendView()
    private let emptyFriendView = EmptyFriendView()

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
        
        if kakaoFriendView.kakaoFriendTableViewModel.count == 0 {
            view.addSubview(emptyFriendView)
            emptyFriendView.snp.makeConstraints {
                $0.top.leading.trailing.equalToSuperview()
            }
        } else {
            view.addSubview(kakaoFriendView)
            kakaoFriendView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
    }
}
