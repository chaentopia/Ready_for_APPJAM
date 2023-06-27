//
//  TableViewCell.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/06/27.
//

import UIKit

import SnapKit
import Then

final class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension TableViewCell {
    private func setStyle() {
        
        separatorInset.left = 0
        selectionStyle = .none
    }
    
    private func setLayout() {
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
    }
    
    func configureCell(_ name: String) {
        nameLabel.text = name
    }
}
