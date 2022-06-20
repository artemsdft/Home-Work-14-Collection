//
//  Header.swift
//  Home Work 14 Collection
//
//  Created by Артем Дербин on 20.06.2022.
//

import UIKit

class Header: UICollectionReusableView {
    static let identifier = "SectionHeader"
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var button: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .link
        button.titleLabel?.font = UIFont(name: "system", size: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var separator: UIView = {
        let separator = UIView(frame: .zero)
        separator.backgroundColor = .lightGray
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    override func prepareForReuse() {
        title.text = nil
        button.setTitle(nil, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpHierarchy()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpHierarchy() {
        addSubview(title)
        addSubview(button)
        addSubview(separator)
    }
    
    func setUpLayout() {
        title.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        button.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        separator.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        separator.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
    }
}
