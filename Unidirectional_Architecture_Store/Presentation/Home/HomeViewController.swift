//
//  HomeViewController.swift
//  Unidirectional_Architecture_Store
//
//  Created by chminii on 6/13/24.
//

import UIKit

final class HomeViewController: UIViewController {
  private let togglePhotoPickerButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    layout()
  }
}

extension HomeViewController {
  func configure() {
    configureTogglePhotoPickerButton()
  }
  
  func configureTogglePhotoPickerButton() {
    var configuration = UIButton.Configuration.tinted()
    configuration.title = "사진 고르기"
    togglePhotoPickerButton.configuration = configuration
  }
}

extension HomeViewController {
  func layout() {
    view.addSubview(togglePhotoPickerButton)
    togglePhotoPickerButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      togglePhotoPickerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      togglePhotoPickerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}
