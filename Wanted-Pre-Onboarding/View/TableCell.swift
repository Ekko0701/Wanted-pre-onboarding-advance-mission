//
//  TableCell.swift
//  Wanted-Pre-Onboarding
//
//  Created by Ekko on 2023/03/05.
//

import Foundation
import UIKit
import Then
import SnapKit

class TableCell: UITableViewCell {
    static let identifier = "TableCell"
    
    // MARK: - Properties
    
    // MARK: - Views
    var imgView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(systemName: "photo")
        $0.backgroundColor = .systemGreen
    }
    
    var progressBar = UIProgressView().then {
        $0.progressViewStyle = .default
    }
    
    var loadButton = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.setTitle("Load", for: .normal)
    }
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureStyle()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Life Cycles
    
    // MARK: - Configures
    private func configureStyle() {
        self.backgroundColor = .clear
    }
    
    private func configureLayout() {
        contentView.addSubview(imgView)
        contentView.addSubview(progressBar)
        contentView.addSubview(loadButton)
        
        imgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            //make.height.equalTo(70)
            make.width.equalTo(120)
        }
        
        progressBar.snp.makeConstraints { make in
            // * height
            make.centerY.equalToSuperview()
            make.leading.equalTo(imgView.snp.trailing).offset(8)
        }
        
        loadButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.centerY.equalToSuperview()
            make.leading.equalTo(progressBar.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
    }
}
