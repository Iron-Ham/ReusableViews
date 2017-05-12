//
//  ExampleTableViewHeaderFooterViewController.swift
//  ReusableViews
//
//  Created by Hesham Salman on 5/11/17.
//

import UIKit

class TableViewHeaderExampleViewController: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(ExampleTableViewHeaderFooterView.self)
  }

  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return standardTableViewHeaderSize
  }

  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableHeaderFooterView(inSection: section) as ExampleTableViewHeaderFooterView
    header.sectionTitleLabel.text = "Neat Table Header example"
    return header
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
}
