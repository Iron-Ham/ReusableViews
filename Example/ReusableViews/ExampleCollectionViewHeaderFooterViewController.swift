//
//  ExampleCollectionViewHeaderFooterViewController.swift
//  ReusableViews
//
//  Created by Hesham Salman on 5/11/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import ReusableViews
import UIKit

class ExampleCollectionViewHeaderFooterViewController: UICollectionViewController {

  override func viewDidLoad() {
    collectionView?.register(ExampleCollectionViewSupplementaryView.self, forSupplementaryViewElementOfKind: .sectionHeader)
  }

  override func collectionView(_ collectionView: UICollectionView,
                               viewForSupplementaryElementOfKind kind: String,
                               at indexPath: IndexPath) -> UICollectionReusableView {
    let view = collectionView.dequeueReusableSupplementaryView(ofKind: .sectionHeader,
                                                               for: indexPath) as ExampleCollectionViewSupplementaryView
    view.titleLabel.text = "COOL EXAMPLE  DUDE"
    return view
  }

  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }

}
