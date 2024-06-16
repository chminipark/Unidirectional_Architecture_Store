//
//  PhotoCollectionViewCell.swift
//  Unidirectional_Architecture_Store
//
//  Created by chminii on 6/16/24.
//

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {
  static let identifier = "MyPhotoCollectionViewCell"
  let imageView = UIView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    imageView.backgroundColor = .random
  }
  
  private func layout() {
    contentView.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
}
