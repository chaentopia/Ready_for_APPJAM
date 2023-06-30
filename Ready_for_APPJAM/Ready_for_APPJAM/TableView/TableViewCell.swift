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
    
    lazy var deleteButton = UIButton().then {
        $0.setImage(UIImage(systemName: "trash"), for: .normal)
//        $0.setTitle("친구추가", for: .normal)
//        $0.titleLabel?.textColor = .black
    }
    
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
        contentView.addSubview(deleteButton)
        nameLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        deleteButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(30)
        }
    }
    
    func configureCell(_ name: String) {
        nameLabel.text = name
    }
}
