import Nimble
import Quick

@testable import ReusableViews
class ReusableViewSpec: QuickSpec {
    override func spec() {

      describe("Reusable View") {
        it("has a reuse identifier matching class name for UITableViewCells") {
          expect(UITableViewCell.defaultReuseIdentifier) == String(describing: UITableViewCell.self)
        }

        it("has a reuse identifier matching class name for UICollectionViewCells") {
          expect(UICollectionViewCell.defaultReuseIdentifier) == String(describing: UICollectionViewCell.self)
        }

        it("has a reuse identifier matching class name for UITableViewHeaderFooterViews") {
          expect(UITableViewHeaderFooterView.defaultReuseIdentifier) == String(describing: UITableViewHeaderFooterView.self)
        }
      }

      describe("Storyboard Compatible View") {
        it("has a storyboard identifier matching its class name") {
          expect(UIViewController.storyboardIdentifier) == String(describing: UIViewController.self)
        }
      }

      describe("Nib Loadable View") {
        it("has a nib name matching its class name") {
          expect(MockNibLoadableView.nibName) == String(describing: MockNibLoadableView.self)
        }

        it("can instantiate itself") {
          expect(MockNibLoadableView.create()).to(beAnInstanceOf(MockNibLoadableView.self))
        }
      }
    }
}

class MockNibLoadableView: UIView, NibLoadableView { }
