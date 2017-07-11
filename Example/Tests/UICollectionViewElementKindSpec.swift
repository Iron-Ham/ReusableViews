//
//  UICollectionViewElementKindSpec.swift
//  ReusableViews
//
//  Created by Hesham Salman on 5/11/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Nimble
import Quick

@testable import ReusableViews
class UICollectionViewElementKindSpec: QuickSpec {
  override func spec() {
    describe("UICollectionViewElementKind") {
      it("returns all cases with static `all`") {
        let expected: [UICollectionViewElementKind] = [.sectionHeader, .sectionFooter]
        expect(UICollectionViewElementKind.all) == expected
      }

      it("has the correct count on the enumeration") {
        let expected = 2
        expect(UICollectionViewElementKind.count) == expected
      }

      describe("Type") {
        context("when it is a section footer") {

          var elementKind: UICollectionViewElementKind!

          beforeEach {
            elementKind = UICollectionViewElementKind.sectionFooter
          }

          it("has the correct type") {
            expect(elementKind.type) == UICollectionElementKindSectionFooter
          }
        }

        context("when it is a section header") {
          var elementKind: UICollectionViewElementKind!

          beforeEach {
            elementKind = UICollectionViewElementKind.sectionHeader
          }

          it("has the correct type") {
            expect(elementKind.type) == UICollectionElementKindSectionHeader
          }
        }
      }
    }
  }
}
