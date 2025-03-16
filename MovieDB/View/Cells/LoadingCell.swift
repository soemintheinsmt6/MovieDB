//
//  LoadingCell.swift
//  MovieDB
//
//  Created by Soemin Thein on 16/03/2025.
//

import UIKit

class LoadingCell: UICollectionViewCell {
    static let identifier = "LoadingCell"
    
    private var spinner : UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .medium
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        spinner.startAnimating()
    }
    
    func setup() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(spinner)
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        spinner.startAnimating()
    }
}
