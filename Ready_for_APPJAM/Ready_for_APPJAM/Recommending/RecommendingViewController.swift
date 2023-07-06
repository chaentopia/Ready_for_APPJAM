//
//  RecommendingViewController.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/07/06.
//

import UIKit

import SnapKit
import Then

final class RecommendingViewController: UIViewController {
    
    private let recommendingLabel = UILabel()
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = RecommendingSegmentedControl(items: ["카톡 친구들", "학교 친구들"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let kakaoFriendViewController = UIViewController().then {
        $0.view.backgroundColor = .systemPink
    }
    private let schoolFriendViewController = UIViewController().then {
        $0.view.backgroundColor = .systemTeal
    }
    
    private lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        vc.setViewControllers([self.dataViewControllers[0]], direction: .forward, animated: true)
        vc.delegate = self
        vc.dataSource = self
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    
    var dataViewControllers: [UIViewController] {
        [self.kakaoFriendViewController, self.schoolFriendViewController]
    }
    
    var currentPage: Int = 0 {
      didSet {
        // from segmentedControl -> pageViewController 업데이트
        print(oldValue, self.currentPage)
        let direction: UIPageViewController.NavigationDirection = oldValue <= self.currentPage ? .forward : .reverse
        self.pageViewController.setViewControllers(
          [dataViewControllers[self.currentPage]],
          direction: direction,
          animated: true,
          completion: nil
        )
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        
        self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 16, weight: .medium)], for: .normal)
        self.segmentedControl.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.yellow,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
        self.segmentedControl.addTarget(self, action: #selector(changeValue(control:)), for: .valueChanged)
        self.segmentedControl.selectedSegmentIndex = 0
        self.changeValue(control: self.segmentedControl)
    }
    
    @objc private func changeValue(control: UISegmentedControl) {
        // 코드로 값을 변경하면 해당 메소드 호출 x
        self.currentPage = control.selectedSegmentIndex
    }
}

extension RecommendingViewController {
    private func setUI() {
        view.backgroundColor = .black
        recommendingLabel.do {
            $0.text = "추천하기"
            $0.textColor = .white
            $0.font = .boldSystemFont(ofSize: 20)
        }
    }
    
    private func setLayout() {
        view.addSubview(recommendingLabel)
        view.addSubview(segmentedControl)
        view.addSubview(pageViewController.view)
        
        recommendingLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(42)
//            $0.top.equalTo(view.safeAreaLayoutGuide).offset(22)
            $0.leading.equalToSuperview().offset(16)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.width.equalToSuperview()
            $0.top.equalTo(recommendingLabel.snp.bottom).offset(10)
        }
        
        pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom)
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

extension RecommendingViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard
            let index = self.dataViewControllers.firstIndex(of: viewController),
            index - 1 >= 0
        else { return nil }
        return self.dataViewControllers[index - 1]
    }
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard
            let index = self.dataViewControllers.firstIndex(of: viewController),
            index + 1 < self.dataViewControllers.count
        else { return nil }
        return self.dataViewControllers[index + 1]
    }
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        guard
            let viewController = pageViewController.viewControllers?[0],
            let index = self.dataViewControllers.firstIndex(of: viewController)
        else { return }
        self.currentPage = index
        self.segmentedControl.selectedSegmentIndex = index
    }
}
