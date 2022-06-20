//
//  Model.swift
//  Home Work 14 Collection
//
//  Created by Артем Дербин on 20.06.2022.
//

import UIKit

enum SectionKind: Int {
    case myAlbums
    case peoplePlace
    case mediaFileType
    case another
}

struct AlbumModel: Hashable {
    var image: UIImage
    var text: String
    var numberOfPhoto: String
}

struct Sections: Hashable {
    let type: SectionKind
    let title: String
    let button: String?
    let albums: [AlbumModel]
}

extension Sections {
    static func getAlbums() -> [Sections] {
        let albums = [
            Sections(type: .myAlbums, title: "Мои альбомы",button: "Все", albums: [
                AlbumModel(image: UIImage(named: "TimCook")!, text: "Недавние", numberOfPhoto: "12"),
                AlbumModel(image: UIImage(named: "Event")!, text: "События", numberOfPhoto: "54"),
                AlbumModel(image: UIImage(named: "Favorites")!, text: "Избранные", numberOfPhoto: "132"),
                AlbumModel(image: UIImage(named: "Woz")!, text: "WhatsApp", numberOfPhoto: "45"),
                AlbumModel(image: UIImage(named: "Steve")!, text: "Instagram", numberOfPhoto: "51")
            ]),
            Sections(type: .peoplePlace, title: "Люди и места", button: nil, albums: [
                AlbumModel(image: UIImage(named: "People")!, text: "Люди", numberOfPhoto: "12"),
                AlbumModel(image: UIImage(named: "Cupertino")!, text: "Места", numberOfPhoto: "54")
            ]),
            Sections(type: .mediaFileType, title: "Типы медиафайлов", button: nil, albums: [
                AlbumModel(image: UIImage(systemName: "video")!, text: "Видео", numberOfPhoto: "12"),
                AlbumModel(image: UIImage(systemName: "person.crop.square")!, text: "Селфи", numberOfPhoto: "54"),
                AlbumModel(image: UIImage(systemName: "livephoto")!, text: "Фото Live Photos", numberOfPhoto: "132"),
                AlbumModel(image: UIImage(systemName: "cube")!, text: "Портреты", numberOfPhoto: "45"),
                AlbumModel(image: UIImage(systemName: "timelapse")!, text: "Таймлапс", numberOfPhoto: "54"),
                AlbumModel(image: UIImage(systemName: "person.crop.rectangle.stack")!, text: "Серии", numberOfPhoto: "31"),
                AlbumModel(image: UIImage(systemName: "camera.viewfinder")!, text: "Снимки экрана", numberOfPhoto: "21"),
                AlbumModel(image: UIImage(systemName: "record.circle")!, text: "Запись экрана", numberOfPhoto: "12"),
                AlbumModel(image: UIImage(systemName: "square.stack.3d.forward.dottedline")!, text: "Анимированные", numberOfPhoto: "4"),
            ]),
            Sections(type: .another, title: "Другое", button: nil, albums: [
                AlbumModel(image: UIImage(systemName: "square.and.arrow.down")!, text: "Импортированные", numberOfPhoto: "15"),
                AlbumModel(image: UIImage(systemName: "trash")!, text: "Недавно удаленные", numberOfPhoto: "34"),
                AlbumModel(image: UIImage(systemName: "eye.slash")!, text: "Скрытые", numberOfPhoto: "5")
            ])
        ]
        return albums
    }
}
