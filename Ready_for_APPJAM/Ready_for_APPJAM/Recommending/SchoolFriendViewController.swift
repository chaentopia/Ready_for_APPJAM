//
//  SchoolFriendViewController.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/07/06.
//

import UIKit

import SnapKit
import Then

final class SchoolFriendViewController: UIViewController {
    
    private let schoolFriendView = SchoolFriendView()
    private let emptyFriendView = EmptyFriendView()

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
        view.backgroundColor = .red
    }
    
    private func setLayout() {
//        view.addSubview(schoolFriendView)
        
//        schoolFriendView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
        
        view.addSubview(emptyFriendView)
        
        emptyFriendView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            
        }
    }
}
