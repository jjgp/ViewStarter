//
//  AnotherViewController.swift
//  ViewStarter
//
//  Created by Jason Prasad on 6/26/20.
//  Copyright © 2020 Jason Prasad. All rights reserved.
//

import SnapKit
import SwiftUI

class AnotherViewController: UIViewController {
    
    // StackViews horiz and vertical (StackViews in StackViews to do more!)
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 0
        return stackView
    }()
    
    let viewRed: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = .red
        return view
    }()
    
    let viewBlue: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .magenta
        
        verticalStackView.addArrangedSubview(viewRed)
        verticalStackView.addArrangedSubview(viewBlue)
        verticalStackView.backgroundColor = .yellow
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(verticalStackView)
        
        viewRed.snp.makeConstraints { make in
            make.height.width.equalTo(50)
        }
        
        viewBlue.snp.makeConstraints { make in
            make.height.width.equalTo(50)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.bottom.leading.top.trailing.equalToSuperview()
        }
    }
    
}

struct AnotherViewController_Previews: PreviewProvider {
    static var previews: some View {
        AnotherViewController().previewWrapper
    }
}
