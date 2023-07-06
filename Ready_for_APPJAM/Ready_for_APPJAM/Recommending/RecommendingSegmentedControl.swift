//
//  RecommendingSegmentedControl.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/07/06.
//

import UIKit

import SnapKit
import Then

final class RecommendingSegmentedControl: UISegmentedControl {
    
    // MARK: - Variables
    // MARK: Component
    private lazy var selectedUnderlineView: UIView = {
        let width = self.bounds.size.width / 2
        let height = 2.0
        let xPosition = 0.0
        let yPosition = self.bounds.size.height - height
        let frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        let view = UIView(frame: frame)
        view.backgroundColor = .yellow
//        self.addSubview(view)
        return view
    }()
    
    private lazy var defaultUnderLineView: UIView = {
        let width = self.bounds.size.width
        let height = 2.0
        let xPosition = 0.0
        let yPosition = self.bounds.size.height - height
        let frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        let view = UIView(frame: frame)
        view.backgroundColor = .gray
        self.addSubview(view)
        return view
    }()
    
    // MARK: - Function
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        removeBackgroundAndDivider()
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        removeBackgroundAndDivider()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: Layout Helpers
    override func layoutSubviews() {
        super.layoutSubviews()
        setLayout()
    }
}

// MARK: - extension
extension RecommendingSegmentedControl {
    
    private func setLayout() {
        self.addSubview(defaultUnderLineView)
        self.addSubview(selectedUnderlineView)
        
        self.defaultUnderLineView.frame.origin.x = 0.0
        let underlineFinalXPosition = (self.bounds.width / 2) * CGFloat(self.selectedSegmentIndex)
        UIView.animate(withDuration: 0.1, animations: {self.selectedUnderlineView.frame.origin.x = underlineFinalXPosition})
        self.layer.cornerRadius = 0
    }
    
    //MARK: Custom Function
    private func removeBackgroundAndDivider() {
        let image = UIImage()
        self.setBackgroundImage(image, for: .normal, barMetrics: .default)
        self.setBackgroundImage(image, for: .selected, barMetrics: .default)
        self.setBackgroundImage(image, for: .highlighted, barMetrics: .default)
        self.setDividerImage(image, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
    }
}
