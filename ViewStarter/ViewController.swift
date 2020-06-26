//
//  ViewController.swift
//  ViewStarter
//
//  Created by Jason Prasad on 6/26/20.
//  Copyright © 2020 Jason Prasad. All rights reserved.
//

import SnapKit
import SwiftUI

class ViewController: UIViewController {
    lazy var tableview: UITableView = {
        let tableview = UITableView(frame: .zero)
        // Outstanding
        // 1. DataSource
        tableview.dataSource = self
        // 2. Delegate
        tableview.delegate = self
        
        tableview.backgroundColor = .red
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(tableview)
        
        tableview.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        
        self.setupViews()
    }
    
    func setupViews() {
        tableview.snp.makeConstraints { make in
            make.bottom.leading.topMargin.trailing.equalToSuperview()
        }
    }
}

// MARK:- DataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)
        // register cell
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
//        cell.textLabel?.text = "text label"
//        cell.detailTextLabel?.text = "detail text label"
        return cell
    }
}

// MARK:- Custom Cell
class CustomTableViewCell: UITableViewCell {
    
    let customLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(customLabel)
        customLabel.text = "custom label"
        customLabel.backgroundColor = .blue
        
        setupViews()
    }
    
    func setupViews() {
        customLabel.snp.makeConstraints { make in
            make.trailing.leading.top.bottom.equalTo(contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK:- Delegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 
    }
    
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController().previewWrapper
    }
}

