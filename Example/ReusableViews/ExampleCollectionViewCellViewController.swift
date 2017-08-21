//
//  ExampleCollectionViewCellViewController.swift
//  ReusableViews
//
//  Created by Hesham Salman on 5/11/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import ReusableViews
import UIKit

class ExampleCollectionViewCellViewController: UICollectionViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView?.register(ExampleCollectionCell.self)
  }

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return exampleTitles.count
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(for: indexPath) as ExampleCollectionCell
    cell.titleLabel.text = exampleTitles[indexPath.row]
    return cell
  }

}

private let exampleTitles: [String] = ["This", "Is", "An", "Example", "Bruh"]
