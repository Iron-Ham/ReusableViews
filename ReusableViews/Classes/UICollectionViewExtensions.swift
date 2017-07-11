//
//  UICollectionViewExtensions.swift
//  ReusableViews
//
//  Created by Hesham Salman on 5/11/17.
//
//

import Foundation

public extension UICollectionView {
  /// Register a cell whose reuse identifier is the same as its class name
  ///
  /// - Parameter _: UICollectionViewCell
  public func register<Cell: UICollectionViewCell>(_: Cell.Type)
    where Cell: ReusableView {
      register(Cell.self, forCellWithReuseIdentifier: Cell.defaultReuseIdentifier)
  }

  /// Register a cell from a nib whose reuse identifier and nib name is the same as its class name
  ///
  /// - Parameter _: UICollectionViewCell
  public func register<Cell: UICollectionViewCell>(_: Cell.Type)
    where Cell: ReusableView, Cell: NibLoadableView {
      let bundle = Bundle(for: Cell.self)
      let nib = UINib(nibName: Cell.nibName, bundle: bundle)
      register(nib, forCellWithReuseIdentifier: Cell.defaultReuseIdentifier)
  }

  /// Registers a view as a supplementary view, where its reuse identifier is the same as its class name
  ///
  /// - Parameters:
  ///   - _: UICollectionReusableView
  ///   - kind: String describing supplementary view kind
  public func register<View: UICollectionReusableView>(_: View.Type, forSupplementaryViewElementOfKind kind: UICollectionViewElementKind)
    where View: ReusableView {
      register(View.self,
               forSupplementaryViewOfKind: kind.type,
               withReuseIdentifier: View.defaultReuseIdentifier)
  }

  /// Registers a view as a supplementary view, where its reuse identifier and nib name are the same as its class name
  ///
  /// - Parameters:
  ///   - _: UICollectionReusableView
  ///   - kind: String describing supplementary view kind
  public func register<View: UICollectionReusableView>(_: View.Type, forSupplementaryViewElementOfKind kind: UICollectionViewElementKind)
    where View: ReusableView, View: NibLoadableView {
      let bundle = Bundle(for: View.self)
      let nib = UINib(nibName: View.nibName, bundle: bundle)
      register(nib,
               forSupplementaryViewOfKind: kind.type,
               withReuseIdentifier: View.defaultReuseIdentifier)
  }

  /// Dequeue reusable cell whose reuse identifier is the same as its class name
  ///
  /// Does not require banging the `as` since that's already implicitly handled by this method.
  /// Usage example:
  ///   collectionView.dequeueReusableCell(for: indexPath) as MyCollectionViewCellType
  ///
  /// - Parameter indexPath: indexPath for cell
  /// - Returns: UICollectionViewCell
  public func dequeueReusableCell<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell
    where Cell: ReusableView {
      guard let cell = dequeueReusableCell(withReuseIdentifier: Cell.defaultReuseIdentifier, for: indexPath) as? Cell else {
        fatalError("Could not dequeue cell with identifier: \(Cell.defaultReuseIdentifier)")
      }

      return cell
  }

  /// Dequeue reusable supplementary view whose reuse identifier is the same as its class name
  ///
  /// Does not require banging the `as` since that's already implictly handled by this method.
  ///
  /// - Parameters:
  ///   - elementKind: Case of the UICollectionViewElementKind enumeration
  ///   - indexPath: indexPath for view
  /// - Returns: UICollectionReusableView
  public func dequeueReusableSupplementaryView<View: UICollectionReusableView>(ofKind elementKind: UICollectionViewElementKind,
                                                                               for indexPath: IndexPath) -> View
    where View: ReusableView {
      guard let view = dequeueReusableSupplementaryView(ofKind: elementKind.type,
                                                        withReuseIdentifier: View.defaultReuseIdentifier,
                                                        for: indexPath) as? View else {
        fatalError("Could not dequeue supplementary view with identifier: \(View.defaultReuseIdentifier)")
      }

      return view
  }

}
