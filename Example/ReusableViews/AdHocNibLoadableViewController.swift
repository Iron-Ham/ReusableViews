//
//  AdHocNibLoadableViewController.swift
//  ReusableViews
//
//  Created by Hesham Salman on 8/21/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class AdHocNibLoadableViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTreeView()
  }

  func configureTreeView() {
    let treeView = AdHocView.create()
    treeView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(treeView)
    view.addConstraints(
      NSLayoutConstraint.constraints(
        withVisualFormat: "V:|[treeView]|",
        options: .directionLeadingToTrailing, 
        metrics: nil, 
        views: ["treeView": treeView]
      )
    )
    view.addConstraints(
      NSLayoutConstraint.constraints(
        withVisualFormat: "H:|[treeView]|",
        options: .directionLeadingToTrailing,
        metrics: nil, 
        views: ["treeView": treeView]
      )
    )
  }
}
