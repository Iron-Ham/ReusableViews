//
//  ViewController.swift
//  ReusableViews
//
//  Created by Hesham Salman on 05/11/2017.
//  Copyright (c) 2017 Hesham Salman. All rights reserved.
//

import ReusableViews
import UIKit

class ExampleViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView! {
    didSet {
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(ExampleTableViewCell.self)
    }
  }

}

extension ExampleViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return standardTableViewCellSize
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return standardTableViewHeaderSize
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let section = Section(rawValue: indexPath.section),
      let exampleType: ExampleType = section == .collectionView ?
        CollectionViewExample(rawValue: indexPath.row) : TableViewExample(rawValue: indexPath.row) else {
      fatalError("Unexpected section")
    }
    navigationController?.pushViewController(exampleType.controller, animated: true)

  }
}

extension ExampleViewController: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return Section.count
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    guard let section = Section(rawValue: section) else {
      return nil
    }
    return section.sectionHeader
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let section = Section(rawValue: section) else {
      return 0
    }

    switch section {
    case .collectionView:
      return CollectionViewExample.count
    case .tableView:
      return TableViewExample.count
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let section = Section(rawValue: indexPath.section) else {
      fatalError("Unexpected section")
    }
    let cell = tableView.dequeueReusableCell(for: indexPath) as ExampleTableViewCell

    let exampleType: ExampleType? = section == .collectionView ?
      CollectionViewExample(rawValue: indexPath.row) : TableViewExample(rawValue: indexPath.row)
    cell.titleLabel.text = exampleType?.title

    return cell
  }
}

fileprivate enum Section: Int {
  case tableView, collectionView

  var sectionHeader: String {
    switch self {
    case .tableView:
      return NSLocalizedString("ExampleViewController:SectionHeader:TableView", comment: "")
    case .collectionView:
      return NSLocalizedString("ExampleViewController:SectionHeader:CollectionView", comment: "")
    }
  }

  static var all: [Section] {
    return [.tableView, .collectionView]
  }

  static var count: Int {
    return all.count
  }

}

protocol ExampleType {
  var title: String { get }

  var controller: UIViewController { get }
}

fileprivate enum TableViewExample: Int, ExampleType {
  case cell, headerfooter

  var title: String {
    switch self {
    case .cell:
      return NSLocalizedString("ExampleViewController:CellName:TableViewCell", comment: "")
    case .headerfooter:
      return NSLocalizedString("ExampleViewController:CellName:TableViewHeaderFooter", comment: "")
    }
  }

  var controller: UIViewController {
    switch self {
    case .headerfooter:
      return TableViewHeaderExampleViewController()
    case .cell:
      return ExampleTableViewCellViewController()
    }
  }

  static var all: [TableViewExample] {
    return [.cell, .headerfooter]
  }

  static var count: Int {
    return all.count
  }
}

fileprivate enum CollectionViewExample: Int, ExampleType {
  case cell, headerfooter

  var title: String {
    switch self {
    case .cell:
      return NSLocalizedString("ExampleViewController:CellName:CollectionViewCell", comment: "")
    case .headerfooter:
      return NSLocalizedString("ExampleViewController:CellName:CollectionViewHeaderFooter", comment: "")
    }
  }

  var controller: UIViewController {
    switch self {
    case .headerfooter:
      let flowLayout = UICollectionViewFlowLayout()
      flowLayout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: standardTableViewHeaderSize)
      return ExampleCollectionViewHeaderFooterViewController(collectionViewLayout: flowLayout)
    case .cell:
      return UIStoryboard(name: "Main", bundle: Bundle(for: ExampleViewController.self))
        .instantiateViewControllerOfType(ExampleCollectionViewCellViewController.self)
    }
  }

  static var all: [CollectionViewExample] {
    return [.cell, .headerfooter]
  }

  static var count: Int {
    return all.count
  }
}
