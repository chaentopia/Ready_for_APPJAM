//
//  IGShareViewController.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/06/26.
//

import UIKit

import SnapKit
import Then

final class IGShareViewController: UIViewController {
    
    private let backgroundView = UIView().then {
        $0.backgroundColor = .systemYellow
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "???가 너랑 한강에서\n??? 하고싶대"
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.font = .boldSystemFont(ofSize: 30)
        $0.textColor = .white
    }
    
    private lazy var shareButton = UIButton().then {
        $0.setTitle("인스타그램에 공유하기", for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension IGShareViewController {
    private func setUI() {
        view.backgroundColor = .black
        
    }
    
    private func setLayout() {
        view.addSubview(backgroundView)
        view.addSubview(shareButton)
        
        backgroundView.addSubview(titleLabel)
        
        backgroundView.snp.makeConstraints{
            $0.width.equalTo(300)
            $0.height.equalTo(500)
            $0.top.equalToSuperview().offset(150)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        
        shareButton.snp.makeConstraints{
            $0.top.equalTo(backgroundView.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
    }
}
