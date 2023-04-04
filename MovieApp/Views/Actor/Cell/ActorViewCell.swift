//
//  ActorViewCell.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/04/04.
//

import UIKit
import AlamofireImage

final class ActorViewCell: BaseTableViewCell{
    private let actorImageView = UIImageView()
    private let actorName = UILabel()
    private let popularity = UILabel()
    
    override func configureAndLayoutSubviews() {
        super.configureAndLayoutSubviews()
        addSubviews([actorImageView, actorName, popularity])
        actorImageView.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.trailing.bottom.equalToSuperview()
        }
        
        actorName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.trailing.equalTo(actorImageView.snp.leading).inset(8)
        }
        
        popularity.snp.makeConstraints { make in
            make.top.equalTo(actorName.snp.bottom).inset(12)
            make.trailing.equalTo(actorImageView.snp.leading).inset(8)
        }
    }
}
