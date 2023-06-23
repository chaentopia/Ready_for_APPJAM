//
//  UIImageView+.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/06/23.
//

import UIKit

import Kingfisher

extension UIImageView{
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func kfSetImage(url : String?){
        
        guard let url = url else {
            print(url)
            return }
        
        if let url = URL(string: url) {
            kf.indicatorType = .activity
            kf.setImage(with: url,
                        placeholder: nil,
                        options: [.transition(.fade(1.0))], progressBlock: nil)
        }
    }
}
