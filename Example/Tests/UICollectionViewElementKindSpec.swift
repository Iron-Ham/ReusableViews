//
//  UICollectionViewElementKindSpec.swift
//  ReusableViews
//
//  Created by Hesham Salman on 5/11/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

@testable import ReusableViews
import XCTest

class UICollectionViewElementKindSpec: XCTestCase {

  func test_uicollectionView_elementKind_returnsAllCases() {
    let expected: [UICollectionViewElementKind] = [.sectionHeader, .sectionFooter]
    XCTAssertEqual(UICollectionViewElementKind.all, expected)
  }

  func test_uicollectionView_elmentKind_hasCorrectCount() {
    XCTAssertEqual(UICollectionViewElementKind.count, 2)
  }

  func test_uicollectionView_elementKind_type_sectionFooter() {
    let elementKind = UICollectionViewElementKind.sectionFooter
    XCTAssertEqual(elementKind.type, UICollectionElementKindSectionFooter)
  }

  func test_uicollectionView_elementKind_type_sectionHeader() {
    let elementKind = UICollectionViewElementKind.sectionHeader
    XCTAssertEqual(elementKind.type, UICollectionElementKindSectionHeader)
  }
}
