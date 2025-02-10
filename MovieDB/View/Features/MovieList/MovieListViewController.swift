//
//  MovieListViewController.swift
//  MovieDB
//
//  Created by Soemin Thein on 17/01/2025.
//

import RxSwift
import SDWebImage
import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    private let disposeBag = DisposeBag()
    private let viewModel = MovieListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        bindViewModel()
        viewModel.fetchMovies()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupGradientBackground(view)
    }
    
    private func setupView() {
        title = "MovieDB"
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20), .foregroundColor: UIColor.white]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal"), style: .plain,
            target: self, action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"), style: .plain,
            target: self, action: nil)
        
        setupCollectionViewFlowLayout()
    }
    
    private func setupCollectionViewFlowLayout() {
        let layout = UICollectionViewFlowLayout()
        let numberOfColumns: CGFloat = 3
        let lineSpacing: CGFloat = 10
        let itemSpacing: CGFloat = 10
        
        let width = (screenWidth - ((numberOfColumns - 1) * itemSpacing) - 20) / numberOfColumns // horizontal padding: 20
        let height = width * 3 / 2
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = itemSpacing
        layout.minimumLineSpacing = lineSpacing
        
        movieCollectionView.setCollectionViewLayout(layout, animated: true)
        movieCollectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: MovieCell.identifier)
    }
    
    private func bindViewModel() {
        viewModel.movies
            .bind(to: movieCollectionView.rx.items(cellIdentifier: MovieCell.identifier, cellType: MovieCell.self)) { index, movie, cell in
                cell.configure(with: movie)
            }
            .disposed(by: disposeBag)
    }
    
}
