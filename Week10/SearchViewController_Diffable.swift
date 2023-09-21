//
//  SearchViewController_Diffable.swift
//  Week10
//
//  Created by 서동운 on 9/21/23.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate {
    
    enum Section: Int {
        case main = 0
    }
    
    var list = Array(0...200)
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureViews()
        configureLayout()
        
        var snapshot = dataSource.snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(list)
        dataSource.apply(snapshot)
    }
    
    func configureHierarchy() {
        view.addSubview(collectionView)
    }
    
    func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view)
        }
    }
    
    func configureViews() {
        view.backgroundColor = .systemBackground
        
        let cellRegistration = UICollectionView.CellRegistration<SearchCollectionViewCell, Int> {
            (cell, indexPath, item) in
            cell.label.text = "\(item) 번"
            cell.imageView.image = UIImage(systemName: "star.fill")
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
           
            return cell
        })
        
        collectionView.delegate = self
    }
    
    func createLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = .init(width: 50, height: 50)
        return flowLayout
    }
}

extension SearchViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
}
