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
  /// Defaults to the same name as the class
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

  /// Instantiates and loads from nib a view that conforms to NibLoadableView
  ///
  /// Can fail if the nib cannot be loaded from the view:
  ///  - Usually caused by not matching the name of the nib file with the name of the view 
  ///  - Similar & overly long file names confuse Xcode. For example, AdHocNibLoadableView and AdHocNibLoadableViewController will confuse 
  ///    Xcode and prevent it from instantiating files correctly.
  ///
  /// - Parameters:
  ///   - viewIndex: index of the view, by default 0 
  ///     Currently, additional indexes are unsupported due to the requirement that nibName is the same as className
  ///   - owner: by default nil
  ///   - options: by default nil
  /// - Returns: an instantiated view
  static func create(viewIndex: Int = 0, owner: Any? = nil, options: [AnyHashable: Any]? = nil) -> Self {
    let bundle = Bundle(for: Self.self)
    guard let view = bundle.loadNibNamed(Self.nibName, owner: owner, options: options)?[viewIndex] as? Self else {
      fatalError("Could not instantiate \(Self.self) from nib -- have you conformed to the NibLoadable protocol?")
    }
    return view
  }
}

extension UIViewController: StoryboardCompatibleView { }
extension UITableViewCell: ReusableView { }
extension UICollectionReusableView: ReusableView { }
extension UITableViewHeaderFooterView: ReusableView { }
