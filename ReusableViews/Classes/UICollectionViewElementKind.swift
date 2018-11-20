//
//  UICollectionViewElementKind.swift
//  ReusableViews
//
//  Created by Hesham Salman on 5/11/17.
//
//

import Foundation

/// Convenience enumeration for UICollectionView supplementary view types
public enum UICollectionViewElementKind {
  case sectionHeader, sectionFooter

  var type: String {
    switch self {
    case .sectionFooter:
        return UICollectionView.elementKindSectionFooter
    case .sectionHeader:
        return UICollectionView.elementKindSectionHeader
    }
  }

  static var all: [UICollectionViewElementKind] {
    return [.sectionHeader, .sectionFooter]
  }

  static var count: Int {
    return all.count
  }

}
