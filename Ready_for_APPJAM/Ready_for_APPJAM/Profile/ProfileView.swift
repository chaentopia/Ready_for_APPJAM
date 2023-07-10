//
//  ProfileView.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/07/08.
//

import UIKit
import SnapKit
import Then

final class ProfileView: UIView {
    
    private let navigationBarView = NavigationBarView()
    private let myProfileHeaderView = MyProfileHeaderView()
    lazy var myFriendTableView = UITableView(frame: .zero, style: .grouped)
    lazy var topButton = UIButton()
    private var isButtonHidden: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setDelegate()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileView {
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        self.backgroundColor = .black
        myFriendTableView.do {
            $0.rowHeight = 77
            $0.register(MyFriendTableViewCell.self, forCellReuseIdentifier: MyFriendTableViewCell.identifier)
            $0.register(MyProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "MyProfileHeaderView")
            $0.backgroundColor = .black
            $0.separatorColor = .gray
            $0.separatorStyle = .singleLine
            $0.showsVerticalScrollIndicator = false
        }
        
        topButton.do {
            $0.backgroundColor = .white
            $0.makeCornerRound(radius: 24)
            $0.setImage(UIImage(systemName: "arrow.up"), for: .normal)
            $0.tintColor = .black
            $0.addTarget(self, action: #selector(topButtonTapped), for: .touchUpInside)
            $0.isHidden = true
        }
    }
    
    private func setLayout() {
        let statusBarHeight = UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .first?
                    .statusBarManager?
                    .statusBarFrame.height ?? 20
        self.addSubview(navigationBarView)
        self.addSubview(myFriendTableView)
        self.addSubview(topButton)
        
        navigationBarView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaInsets).offset(statusBarHeight)
            $0.width.equalToSuperview()
            $0.height.equalTo(48.adjustedHeight)
        }
        
        myFriendTableView.snp.makeConstraints {
            $0.top.equalTo(navigationBarView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
        
        topButton.snp.makeConstraints {
            $0.width.height.equalTo(48)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(76)
        }
    }
    
    private func setDelegate() {
        myFriendTableView.dataSource = self
        myFriendTableView.delegate = self
    }
    
    private func updateButtonVisibility() {
        topButton.isHidden = isButtonHidden
    }
    
    @objc func topButtonTapped() {
        myFriendTableView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}

extension ProfileView: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 스크롤이 맨 위에 있는지 여부를 확인하고 isScrollAtTop 값을 업데이트합니다.
        isButtonHidden = scrollView.contentOffset.y <= 0
        updateButtonVisibility()
    }
}
extension ProfileView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0 :
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: MyProfileHeaderView.cellIdentifier) as! MyProfileHeaderView
            return view
        default :
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 304 : 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyFriendTableViewCell.identifier, for: indexPath) as? MyFriendTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
//        cell.configureFriendCell(myFriendTableViewModel[indexPath.row])
        return cell
    }
}


public extension UIView {
    func addBottomBorderWithColor(color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height, width: self.frame.size.width, height: 1)
        self.layer.addSublayer(border)
    }

    func addAboveTheBottomBorderWithColor(color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        self.layer.addSublayer(border)
    }
    
    func makeCornerRound(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}
