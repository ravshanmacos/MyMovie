//
//  MovieListView.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import UIKit
import RxSwift

final class MoviesListView: UIViewController{
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        MovieItemCell.register(to: collectionView)
        return collectionView
    }()
    
    private let disposeBag = DisposeBag()
    
    var viewModel: MoviesListViewModel?{
        didSet{
            setupBindings()
        }
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .backgroundColor
        collectionView.backgroundColor = .backgroundColor
        
        view.addSubviews([collectionView])
        let layoutGuide = view.safeAreaLayoutGuide
        collectionView.top(layoutGuide.topAnchor, 0)
        collectionView.leading(layoutGuide.leadingAnchor, 0)
        collectionView.trailing(layoutGuide.trailingAnchor, 0)
        collectionView.bottom(layoutGuide.bottomAnchor, 0)
    }
    
    private func setupBindings(){
        guard let viewModel else { return }
        viewModel.isDataLoaded.subscribe { [weak self] _ in
            self?.collectionView.reloadData()
        }.disposed(by: disposeBag)
    }
}

//MARK: - UICollectionViewDataSource
extension MoviesListView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.moviesResponse?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MovieItemCell.deque(on: collectionView, at: indexPath)!
        let item = viewModel?.moviesResponse?.results[indexPath.row]
        cell.setupData(item)
        return cell
    }
    
}

//MARK: - UICollectionViewDelegate
extension MoviesListView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movie = viewModel?.moviesResponse?.results[indexPath.row] else{return}
        viewModel?.goToMovieDetailView(movie: movie)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MoviesListView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 32) / 2
        return CGSize(width: width, height: 320)
    }
}
