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
        $0.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension IGShareViewController {
    
    @objc private func shareButtonTapped() {
        
        if let storyShareURL = URL(string: "instagram-stories://share?source_application=1196046794406519") {
            if UIApplication.shared.canOpenURL(storyShareURL)
            {
                
                
                let renderer = UIGraphicsImageRenderer(size: backgroundView.bounds.size)
                
                let renderImage = renderer.image { _ in
                    backgroundView.drawHierarchy(in: backgroundView.bounds, afterScreenUpdates: true)
                }
                
                
                guard let imageData = renderImage.pngData() else {return}
                
                
                
                let pasteboardItems : [String:Any] = [
//                    "com.instagram.sharedSticker.stickerImage": imageData,
                    "com.instagram.sharedSticker.backgroundImage": imageData,
                    "com.instagram.sharedSticker.backgroundTopColor" : "#000000",
                    "com.instagram.sharedSticker.backgroundBottomColor" : "#000000",
                    
                ]
                let pasteboardOptions = [
                    UIPasteboard.OptionsKey.expirationDate : Date().addingTimeInterval(300)
                ]
                
                UIPasteboard.general.setItems([pasteboardItems], options: pasteboardOptions)
                
                
                UIApplication.shared.open(storyShareURL, options: [:], completionHandler: nil)
            }
            else
            {
                let alert = UIAlertController(title: "알림", message: "인스타그램이 필요합니다", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    
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
