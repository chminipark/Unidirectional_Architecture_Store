//
//  DGViewController.swift
//  Unidirectional_Architecture_Store
//
//  Created by chminii on 6/16/24.
//

import UIKit

class DGViewController: UIViewController {
  func configure() {}
  func layout() {}
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if self.traitCollection.userInterfaceStyle == .light {
      self.view.backgroundColor = .white
    } else {
      self.view.backgroundColor = .black
    }
    
    registerForTraitChanges(
      [UITraitUserInterfaceStyle.self],
      handler: { (self: Self, previousTraitCollection: UITraitCollection) in
        if self.traitCollection.userInterfaceStyle == .light {
          self.view.backgroundColor = .white
        } else {
          self.view.backgroundColor = .black
        }
      }
    )
    
    configure()
    layout()
  }
}
