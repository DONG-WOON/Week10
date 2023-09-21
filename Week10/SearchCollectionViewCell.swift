//
//  SearchCollectionViewCell.swift
//  Week10
//
//  Created by 서동운 on 9/21/23.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func configure() {
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        
        label.text = "SearchCollectionViewCell"
        
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        label.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
