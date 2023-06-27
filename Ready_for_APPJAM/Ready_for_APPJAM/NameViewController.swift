//
//  NameViewController.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/06/26.
//

import UIKit

import SnapKit
import Then

final class NameViewController: UIViewController {
    
    var name: NSString = "정채은"
    var isFullName: Bool = true
    
    private let inputTextField = UITextField().then {
        $0.placeholder = "정채은"
        $0.backgroundColor = .white
        $0.textAlignment = .center
    }
    
    private lazy var confirmButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
    }
    
    private lazy var nameLabel = UILabel().then {
        $0.text = String(name)
        $0.font = .boldSystemFont(ofSize: 40)
        $0.textColor = .white
    }
    
    private lazy var changeButton = UIButton().then {
        $0.setTitle("초성 ↔ 전체", for: .normal)
        $0.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension NameViewController {
    private func setUI() {
        view.backgroundColor = .systemYellow
    }
    
    private func setLayout() {
        view.addSubview(inputTextField)
        view.addSubview(confirmButton)
        view.addSubview(nameLabel)
        view.addSubview(changeButton)
        
        inputTextField.snp.makeConstraints {
            $0.bottom.equalTo(nameLabel.snp.top).offset(-50)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(20)
            $0.width.equalTo(150)
        }
        
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(inputTextField).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        changeButton.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc
    private func confirmButtonTapped() {
        name = inputTextField.text! as NSString
        nameLabel.text = String(name)
    }
    
    @objc
    private func changeButtonTapped() {
        if isFullName == true {
            var initialName: String = "";

            for i in 0..<name.length {
                let oneChar:UniChar = name.character(at:i)
                
                if (oneChar >= 0xAC00 && oneChar <= 0xD7A3) {
                    
                    var firstCodeValue = ((oneChar - 0xAC00)/28)/21
                    firstCodeValue += 0x1100;
                    
                    initialName = initialName.appending(String(format:"%C", firstCodeValue))
                    
                    nameLabel.text = initialName
                } else {
                    initialName = initialName.appending(String(format:"%C", oneChar))
                    nameLabel.text = initialName
                }
            }
            
        } else {
            nameLabel.text = String(name)
        }
        isFullName.toggle()
    }
}
