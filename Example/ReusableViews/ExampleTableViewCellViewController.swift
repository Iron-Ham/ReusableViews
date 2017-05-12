//
//  ExampleTableViewCellViewController.swift
//  ReusableViews
//
//  Created by Hesham Salman on 5/11/17.
//  Copyright © 2017 Hesham Salman. All rights reserved.
//

import UIKit
import ReusableViews

class ExampleTableViewCellViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(ExampleTableViewCell.self)
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(for: indexPath) as ExampleTableViewCell
    cell.titleLabel.text = cellText[indexPath.row]
    return cell
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cellText.count
  }

}

fileprivate let cellText: [String] = ["Hello", "This", "Is", "An", "Example"]
