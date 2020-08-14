//
//  HomeHotelCell.swift
//  Venturus Challenge
//
//  Created by Thiago Augusto on 28/07/20.
//  Copyright © 2020 objectivesev. All rights reserved.
//

import UIKit
import SDWebImage

class HomeImageCell: UICollectionViewCell {
    
    private lazy var resultImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resultImage.image = nil
    }
    
    func configure(image: Image) {
        resultImage.loadWith(image.link)
    }
}

private extension HomeImageCell {
    func configureLayout() {        
        resultImage.createConstraints(contentView) { maker in
            maker.edges.equalToSuperview()
        }
    }
}
