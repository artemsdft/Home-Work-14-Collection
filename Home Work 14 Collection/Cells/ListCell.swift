//
//  ListCell.swift
//  Home Work 14 Collection
//
//  Created by Артем Дербин on 20.06.2022.
//

import UIKit

class ListCell: UICollectionViewCell {
    static var identifier = "thirdCell"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "system", size: 17)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var numberOfPhoto: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "system", size: 17)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 5
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let disclosureIndicator: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = .secondaryLabel
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let separator: UIView = {
        let separator = UIView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray
        return separator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpHierarchy()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpHierarchy() {
        contentView.addSubview(label)
        contentView.addSubview(numberOfPhoto)
        contentView.addSubview(imageView)
        //        contentView.addSubview(separator)
        contentView.addSubview(disclosureIndicator)
    }
    
    func setUpLayout() {
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8).isActive = true
        imageView.widthAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100).isActive = true
        
        numberOfPhoto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35).isActive = true
        numberOfPhoto.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        disclosureIndicator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        disclosureIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        //        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        //        separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        //        separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        //        separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5).isActive = true
    }
    
    func configure(with albumModel: AlbumModel) {
        imageView.image = albumModel.image
        numberOfPhoto.text = albumModel.numberOfPhoto
        label.text = albumModel.text
    }
}
