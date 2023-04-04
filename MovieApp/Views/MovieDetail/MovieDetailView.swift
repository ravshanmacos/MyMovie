//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/30.
//

import UIKit
import SnapKit
import AlamofireImage
import RxSwift

final class MovieDetailView: UIViewController{
    
    private lazy var containerStackView: UIStackView = {
       let stack = UIStackView()
        stack.spacing = 4
    //    stack.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        stack.axis = .vertical
        stack.distribution = .fillProportionally
       // stack.alignment = .fill
        return stack
    }()
    private let mainImageView: UIImageView = UIImageView()
    private let movieTitleLabel = UILabel()
    private let movieCreatedAtLabel = UILabel()
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    private let actorsLabel = UILabel()
    
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        ActorItemCell.register(to: collectionView)
        return collectionView
    }()
    
    var viewModel: MovieDetailViewModel?{
        didSet{
            setupBindings()
        }
    }
    
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        let mainImageWrapper = UIView()
        mainImageWrapper.addSubview(mainImageView)
        
        view.addSubviews([containerStackView])
        containerStackView.addArrangedSubviews([mainImageWrapper, movieTitleLabel, movieCreatedAtLabel, descriptionLabel, actorsLabel, collectionView])
        
        //contraints
        containerStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
           // make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        
        mainImageWrapper.snp.makeConstraints { make in
            make.height.equalTo(250)
        }
        
        movieTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
        }

        mainImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        movieCreatedAtLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.height.equalTo(160)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(120)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setupBindings(){
        movieTitleLabel.text = viewModel?.movieDetail?.title
        movieCreatedAtLabel.text = viewModel?.movieDetail?.releaseDate
        descriptionLabel.text = viewModel?.movieDetail?.overview
        if let imageURL = viewModel?.movieDetail?.itemImage{
            mainImageView.af.setImage(withURL: imageURL)
        }
        viewModel?.isDataLoaded
            .subscribe({ [weak self] _ in
                self?.collectionView.reloadData()
            }).disposed(by: disposeBag)
    }
}

//MARK: - UICollectionViewDataSource
extension MovieDetailView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.actorsMovie?.cast?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ActorItemCell.deque(on: collectionView, at: indexPath)!
        guard let viewModel,
                let actorsMovie = viewModel.actorsMovie,
              let casts = actorsMovie.cast
        else {return cell}
        let actor = casts[indexPath.row]
        cell.setupData(actor)
        return cell
    }
    
    
}

//MARK: - UICollectionViewDelegate
extension MovieDetailView: UICollectionViewDelegate{
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MovieDetailView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 100)
    }
}
