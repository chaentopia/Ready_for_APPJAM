//
//  TableViewController.swift
//  Ready_for_APPJAM
//
//  Created by 정채은 on 2023/06/27.
//

import UIKit

import SnapKit
import Then

struct Model {
    let name: String
}

final class TableViewController: UIViewController {
    
    var tableViewModel: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l"]
    
    lazy var tableView = UITableView().then {
        $0.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        $0.dataSource = self
        $0.delegate = self
        $0.rowHeight = 50
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension TableViewController {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexPath = tableView.indexPathForRow(at: point) else { return }
        tableViewModel.remove(at: indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: .right)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        //        let item = dummy[indexPath.row]
        cell.deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        cell.configureCell(tableViewModel[indexPath.row])
        return cell
    }
}
