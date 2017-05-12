import Quick
import Nimble

@testable import ReusableViews
class ReusableViewSpec: QuickSpec {
    override func spec() {

      describe("Reusable View") {
        it("has a reuse identifier matching class name for UITableViewCells") {
          expect(UITableViewCell.defaultReuseIdentifier).to(equal(String(describing: UITableViewCell.self)))
        }

        it("has a reuse identifier matching class name for UICollectionViewCells") {
          expect(UICollectionViewCell.defaultReuseIdentifier).to(equal(String(describing: UICollectionViewCell.self)))
        }

        it("has a reuse identifier matching class name for UITableViewHeaderFooterViews") {
          expect(UITableViewHeaderFooterView.defaultReuseIdentifier).to(equal(String(describing: UITableViewHeaderFooterView.self)))
        }
      }

      describe("Storyboard Compatible View") {
        it("has a storyboard identifier matching its class name") {
          expect(UIViewController.storyboardIdentifier).to(equal(String(describing: UIViewController.self)))
        }
      }

      describe("Nib Loadable View") {
        it("has a nib name matching its class name") {
          expect(MockNibLoadableView.nibName).to(equal(String(describing: MockNibLoadableView.self)))
        }
      }
    }
}

class MockNibLoadableView: UIView, NibLoadableView { }
