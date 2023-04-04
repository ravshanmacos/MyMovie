//
//  ActorItemCell.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/30.
//

import UIKit
import AlamofireImage

final class ActorItemCell: BaseCollectionViewCell{
    
    private let containerStackView = UIStackView()
    private let actorImageView = UIImageView()
    private let actorName = UILabel()
    
    override func configureAndLayoutSubviews() {
        super.configureAndLayoutSubviews()
        actorName.font = UIFont.systemFont(ofSize: 12)
        actorName.textAlignment = .center
        actorImageView.contentMode = .scaleAspectFit
        
        addSubview(containerStackView)
        
        containerStackView.spacing = 2
        containerStackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        containerStackView.axis = .vertical
        containerStackView.distribution = .fill
        containerStackView.alignment = .fill
        //containerStackView.backgroundColor =
        
        let imageViewWrapper = UIView()
        imageViewWrapper.addSubview(actorImageView)
        
        containerStackView.addArrangedSubviews([imageViewWrapper, actorName])
        
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        actorImageView.snp.makeConstraints { make in
            make.edges.equalTo(imageViewWrapper.snp.edges)
        }
        
        actorImageView.clipsToBounds = true
    }
    
    func setupData(_ actor: Cast?){
        guard let actor else { return }
        actorName.text = actor.name
        if let imageURL = actor.profileImageURL{
            actorImageView.af.setImage(withURL: imageURL)
        }
    }
}

