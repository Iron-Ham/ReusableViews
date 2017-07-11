//
//  UITableViewExtensions.swift
//  ReusableViews
//
//  Created by Hesham Salman on 5/11/17.
//
//

import Foundation

public extension UITableView {
  /// Register a cell whose reuse identifier is the same as its class name
  ///
  /// - Parameter _: UITableViewCell
  public func register<Cell: UITableViewCell>(_: Cell.Type) where Cell: ReusableView {
    register(Cell.self, forCellReuseIdentifier: Cell.defaultReuseIdentifier)
  }

  /// Register a header footer view whose reuse identifier is the same as its class name
  ///
  /// - Parameter _: UIHeaderFooterView
  public func register<View: UITableViewHeaderFooterView>(_: View.Type) where View: ReusableView {
    register(View.self, forHeaderFooterViewReuseIdentifier: View.defaultReuseIdentifier)
  }

  /// Register a cell from a nib whose reuse identifier and nib name is the same as its class name
  ///
  /// - Parameter _: UITableViewCell
  public func register<Cell: UITableViewCell>(_: Cell.Type)
    where Cell: ReusableView, Cell: NibLoadableView {
      let bundle = Bundle(for: Cell.self)
      let nib = UINib(nibName: Cell.nibName, bundle: bundle)
      register(nib, forCellReuseIdentifier: Cell.defaultReuseIdentifier)
  }

  /// Register a reusable header footer view whose reuse identifier and
  /// nib name is the same as its class name
  ///
  /// - Parameter _: UIHeaderFooterView
  public func register<View: UITableViewHeaderFooterView>(_: View.Type)
    where View: ReusableView, View: NibLoadableView {
      let bundle = Bundle(for: View.self)
      let nib = UINib(nibName: View.nibName, bundle: bundle)
      register(nib, forHeaderFooterViewReuseIdentifier: View.defaultReuseIdentifier)
  }

  /// Dequeues a reusable cell whose reuse identifier is the same as its class name
  ///
  /// Does not require banging the `as` since that's already implicitly handled by this method.
  /// Usage example:
  ///   tableView.dequeueReusableCell(for: indexPath) as MyTableViewCellType
  ///
  /// - Parameter indexPath: indexPath for cell
  /// - Returns: UITableViewCell
  public func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell
    where Cell: ReusableView {
      guard let cell = dequeueReusableCell(withIdentifier: Cell.defaultReuseIdentifier, for: indexPath) as? Cell else {
        fatalError("Could not dequeue cell with identifier: \(Cell.defaultReuseIdentifier)")
      }

      return cell
  }

  /// Dequeues a reusable header footer view whose reuse identifier is the same as its class name
  ///
  /// Does not require banging the 'as' since that's implicitly handled by this method.
  ///
  /// - Parameter section: Int for section
  /// - Returns: UITableViewHeaderFooterView
  public func dequeueReusableHeaderFooterView<View: UITableViewHeaderFooterView>(inSection section: Int) -> View
    where View: ReusableView {
      guard let view = dequeueReusableHeaderFooterView(withIdentifier: View.defaultReuseIdentifier) as? View else {
        fatalError("Could not dequeue cell with identifier: \(View.defaultReuseIdentifier)")
      }
      return view
  }

}
