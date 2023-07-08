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
    
    // MARK: - Variables
    // MARK: Component
    private let recommendingLabel = UILabel()
    private let segmentedControl = RecommendingSegmentedControl(items: ["카톡 친구들", "학교 친구들"])
    private lazy var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    private let kakaoFriendViewController = KakaoFriendViewController()
    private let schoolFriendViewController = SchoolFriendViewController()
    
    
    // MARK: Property
    var dataViewControllers: [UIViewController] {
        [self.kakaoFriendViewController, self.schoolFriendViewController]
    }
    
    /// 이동 방향을 결정해주는 변수, 방향 애니메이션을 위함
    var currentPage: Int = 0 {
      didSet {
        let direction: UIPageViewController.NavigationDirection = oldValue <= self.currentPage ? .forward : .reverse
        self.pageViewController.setViewControllers(
          [dataViewControllers[self.currentPage]],
          direction: direction,
          animated: true,
          completion: nil
        )
      }
    }
    
    // MARK: - Function
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDelegate()
        setSegmentedControl()
    }
}

// MARK: - extension
extension RecommendingViewController {
    
    // MARK: Layout Helpers
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        view.backgroundColor = .black
        recommendingLabel.do {
            $0.text = "추천하기"
            $0.textColor = .white
            $0.font = .boldSystemFont(ofSize: 20)
        }
        pageViewController.do {
            $0.setViewControllers([self.dataViewControllers[0]], direction: .forward, animated: true)
        }
    }
    
    private func setLayout() {
        view.addSubview(recommendingLabel)
        view.addSubview(segmentedControl)
        view.addSubview(pageViewController.view)
        
        recommendingLabel.snp.makeConstraints {
            let statusBarHeight = UIApplication.shared.connectedScenes
                        .compactMap { $0 as? UIWindowScene }
                        .first?
                        .statusBarManager?
                        .statusBarFrame.height ?? 20
            
            $0.top.equalTo(view.safeAreaInsets).offset(statusBarHeight + 22.adjusted)
            $0.leading.equalToSuperview().offset(16.adjusted)
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
    
    //MARK: Custom Function
    private func setDelegate() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
    }
    
    private func setSegmentedControl() {
        self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 16, weight: .medium)], for: .normal)
        self.segmentedControl.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: UIColor.yellow,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .selected)
        self.segmentedControl.addTarget(self, action: #selector(changeValue(control:)), for: .valueChanged)
        self.segmentedControl.selectedSegmentIndex = 0
        self.changeValue(control: self.segmentedControl)
    }
    
    // MARK: Objc Function
    @objc private func changeValue(control: UISegmentedControl) {
        self.currentPage = control.selectedSegmentIndex
    }
}

// MARK: UIPageViewControllerDelegate
extension RecommendingViewController: UIPageViewControllerDelegate { }

// MARK: UIPageViewControllerDataSource
extension RecommendingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard let index = self.dataViewControllers.firstIndex(of: viewController),
            index - 1 >= 0
        else { return nil }
        return self.dataViewControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = self.dataViewControllers.firstIndex(of: viewController),
            index + 1 < self.dataViewControllers.count
        else { return nil }
        return self.dataViewControllers[index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewController = pageViewController.viewControllers?[0],
            let index = self.dataViewControllers.firstIndex(of: viewController)
        else { return }
        self.currentPage = index
        self.segmentedControl.selectedSegmentIndex = index
    }
}
