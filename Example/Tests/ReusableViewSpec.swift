@testable import ReusableViews
import XCTest

class ReusableViewSpec: XCTestCase {

  func test_tableViewCell_hasMatchingReuseIdentifier() {
    XCTAssertEqual(UITableViewCell.defaultReuseIdentifier, String(describing: UITableViewCell.self))
  }

  func test_collectionViewCell_hasMatchingReuseIdentifier() {
    XCTAssertEqual(UICollectionViewCell.defaultReuseIdentifier, String(describing: UICollectionViewCell.self))
  }

  func test_headerFooterView_hasMatchingReuseIdentifier() {
    XCTAssertEqual(UITableViewHeaderFooterView.defaultReuseIdentifier, String(describing: UITableViewHeaderFooterView.self))
  }

  func test_storyboardCompatibleView_hasMatchingStoryboardIdentifier() {
    XCTAssertEqual(UIViewController.storyboardIdentifier, String(describing: UIViewController.self))
  }

  func test_nibLoadableView_hasMatchingNibNameIdentifier() {
    XCTAssertEqual(MockNibLoadableView.nibName, String(describing: MockNibLoadableView.self))
  }

}

class MockNibLoadableView: UIView, NibLoadableView { }
