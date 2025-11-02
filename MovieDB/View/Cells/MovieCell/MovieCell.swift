//
//  MovieCell.swift
//  MovieDB
//
//  Created by Soemin Thein on 10/02/2025.
//

import SDWebImage
import UIKit

class MovieCell: UICollectionViewCell {
    
    static let identifier = "movieCell"

    @IBOutlet weak var movieImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 15
    }
    
    func configure(with item: Movie) {
        movieImage.sd_setImage(with: URL(string: item.image), placeholderImage: UIImage.moviePlaceholderImage)
    }
}
