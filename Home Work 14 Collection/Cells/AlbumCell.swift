//
//  AlbumCell.swift
//  Home Work 14 Collection
//
//  Created by Артем Дербин on 20.06.2022.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    static var identifier = "Firstcell"
    
    private var imageView: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 5
        return image
    }()
    
    private var label: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    private var numberOfPhotos: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        label.textColor = .lightGray
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setUpHierarchy()
        setUpLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        contentView.addSubview(numberOfPhotos)
    }
    
    private func setUpLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            numberOfPhotos.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            numberOfPhotos.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            numberOfPhotos.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
        ])
    }
    
    func configure(with albumModel: AlbumModel) {
        imageView.image = albumModel.image
        label.text = albumModel.text
        numberOfPhotos.text = albumModel.numberOfPhoto
    }
}

