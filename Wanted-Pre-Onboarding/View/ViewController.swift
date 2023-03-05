//
//  ViewController.swift
//  Wanted-Pre-Onboarding
//
//  Created by Ekko on 2023/03/05.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Views
    private let tableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.register(TableCell.self, forCellReuseIdentifier: TableCell.identifier)
    }
    
    private var allLoadButton = UIButton().then {
        $0.setTitle("Load All Images", for: .normal)
        $0.backgroundColor = .systemBlue
    }
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStyle()
        configureLayout()
        configureTableView()
    }
    
    // MARK: - Configures
    private func configureStyle() {
        self.view.backgroundColor = .white
    }
    
    private func configureLayout() {
        view.addSubview(tableView)
        view.addSubview(allLoadButton)
        
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(550)
        }
        
        allLoadButton.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.identifier, for: indexPath) as? TableCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}

