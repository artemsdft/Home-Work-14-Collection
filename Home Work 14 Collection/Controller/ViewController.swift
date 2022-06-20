//
//  ViewController.swift
//  Home Work 14 Collection
//
//  Created by Артем Дербин on 20.06.2022.
//

import UIKit

class CollectionViewController: UIViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Sections, AlbumModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot <Sections, AlbumModel>
    
    private var collectionView: UICollectionView!
    private var sections = Sections.getAlbums()
    private var dataSource: DataSource!
    private var snapshot = Snapshot()
    
    func createCollectionView() {
        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: createCompositionalLayout()
        )
        collectionView.register(
            AlbumCell.self,
            forCellWithReuseIdentifier: AlbumCell.identifier
        )
        collectionView.register(
            ListCell.self,
            forCellWithReuseIdentifier: ListCell.identifier
        )
        collectionView.register(
            Header.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: Header.identifier
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        createCollectionLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
        createCollectionView()
        createDataSource()
        reloadData()
    }
    
    func createCollectionLayout() {
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [self] (sections, layoutEnvironment) -> NSCollectionLayoutSection? in
            switch sections {
            case 0:
                return createLayoutFirstSection()
            case 1:
                return createLayoutSecondSection()
            case 2:
                return createLayoutThirdSection()
            default:
                return createLayoutThirdSection()
            }
        }
        
        return layout
    }
    
    private func createLayoutFirstSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 5,
            leading: 0,
            bottom: 50,
            trailing: 0
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(185),
            heightDimension: .absolute(500))
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count:2
        )
        group.contentInsets = NSDirectionalEdgeInsets(
            top: 5,
            leading: 5,
            bottom: 5,
            trailing: 0
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [self.createSectionHeader()]
        section.contentInsets.bottom = 10
        return section
    }
    
    private func createLayoutSecondSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 5,
            leading: 0,
            bottom: 5,
            trailing: 0
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(185),
            heightDimension: .absolute(500 / 2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count:1)
        group.contentInsets = NSDirectionalEdgeInsets(
            top: 5,
            leading: 5,
            bottom: 5,
            trailing: 0
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [self.createSectionHeader()]
        section.contentInsets.bottom = 5
        return section
    }
    
    private func createLayoutThirdSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 5,
            leading: 5,
            bottom: 0,
            trailing: 5
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(50)
        )
        
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(
            top: 5,
            leading: 5,
            bottom: 5,
            trailing: 0
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [self.createSectionHeader()]
        section.contentInsets.bottom = 10
        return section
    }
    
    private func createDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, albumModel) -> UICollectionViewCell? in
            switch self.sections[indexPath.section].type {
            case .myAlbums:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.identifier, for: indexPath) as! AlbumCell
                cell.configure(with: albumModel)
                return cell
            case .peoplePlace:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.identifier, for: indexPath) as! AlbumCell
                cell.configure(with: albumModel)
                return cell
            case .mediaFileType:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.identifier, for: indexPath) as! ListCell
                cell.configure(with: albumModel)
                return cell
            case .another:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.identifier, for: indexPath) as! ListCell
                cell.configure(with: albumModel)
                return cell
            }
        })
        dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: Header.identifier,
                for: indexPath
            ) as? Header else {
                fatalError()
            }
            guard let albumGroup = self?.dataSource?.itemIdentifier(for: indexPath),
                  let section = self?.dataSource?.snapshot().sectionIdentifier(containingItem: albumGroup),
                  !section.title.isEmpty else {
                fatalError()
            }
            
            sectionHeader.title.text = section.title
            if let buttonText = section.button {
                sectionHeader.button.setTitle(buttonText, for: .normal)
            }
            return sectionHeader
        }
    }
    func reloadData() {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        for section in sections {
            snapshot.appendItems(section.albums, toSection: section)
        }
        dataSource?.apply(snapshot)
    }
    
    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(50)
        )
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return layoutSectionHeader
    }
}


