//
//  ReusableView.swift
//  ReusableViews
//
//  Created by Hesham Salman on 5/11/17
//
//

import Foundation

/// A reusable, recycled view.
public protocol ReusableView: class {
  /// Reuse identifier for a recycled view.
  static var defaultReuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
  /// The reuse identifier for the class.
  /// The same as the class name.
  static var defaultReuseIdentifier: String {
    return String(describing: self)
  }
}

/// A view controller or other object that can be instantiated from the storyboard
public protocol StoryboardCompatibleView: class {
  static var storyboardIdentifier: String { get }
}

public extension StoryboardCompatibleView where Self: UIViewController {
  // Defaults to the same name as the class
  static var storyboardIdentifier: String {
    return String(describing: self)
  }
}

/// A view loadable from a nib
public protocol NibLoadableView: class {
  /// Name for the nib
  static var nibName: String { get }
}

public extension NibLoadableView where Self: UIView {
  /// Defaults to the same name as the class
  static var nibName: String {
    return String(describing: self)
  }
}

extension UIViewController: StoryboardCompatibleView { }
extension UITableViewCell: ReusableView { }
extension UICollectionReusableView: ReusableView { }
extension UITableViewHeaderFooterView: ReusableView { }
