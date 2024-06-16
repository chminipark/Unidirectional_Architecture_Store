//
//  PhotoCollectionViewController.swift
//  Unidirectional_Architecture_Store
//
//  Created by chminii on 6/13/24.
//

import UIKit

final class PhotoCollectionViewController: DGViewController {
  private lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.compositionalLayout)
    collectionView.backgroundColor = .clear
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.showsVerticalScrollIndicator = true
    collectionView.register(
      PhotoCollectionViewCell.self,
      forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier
    )
    collectionView.dataSource = self
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    layout()
  }
  
  override func layout() {
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
  }
  
  private let compositionalLayout: UICollectionViewCompositionalLayout = {
    let fraction: CGFloat = 1 / 3
    let inset: CGFloat = 3
    
    let itemSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(fraction),
      heightDimension: .fractionalHeight(1)
    )
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1),
      heightDimension: .fractionalWidth(fraction)
    )
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    group.interItemSpacing = .fixed(inset)
    
    let section = NSCollectionLayoutSection(group: group)
    section.interGroupSpacing = inset
    let padding: CGFloat = 10
    section.contentInsets = .init(top: padding, leading: padding, bottom: padding, trailing: padding)
    return UICollectionViewCompositionalLayout(section: section)
  }()
}

extension PhotoCollectionViewController: UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return 100
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: PhotoCollectionViewCell.identifier,
      for: indexPath
    ) as? PhotoCollectionViewCell
    else {
      return PhotoCollectionViewCell()
    }
    
    return cell
  }
}
