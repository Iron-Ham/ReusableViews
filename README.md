# ReusableViews

[![CI Status](http://img.shields.io/travis/heshamsalman/ReusableViews.svg?style=flat)](https://travis-ci.org/heshamsalman/ReusableViews)
[![Version](https://img.shields.io/cocoapods/v/ReusableViews.svg?style=flat)](http://cocoapods.org/pods/ReusableViews)
[![License](https://img.shields.io/cocoapods/l/ReusableViews.svg?style=flat)](http://cocoapods.org/pods/ReusableViews)
[![Platform](https://img.shields.io/cocoapods/p/ReusableViews.svg?style=flat)](http://cocoapods.org/pods/ReusableViews)

## Why?

This extension package solves the following problems:
- Forces your team to adhere to standard practices by:
  - Making storyboard identifiers the same as their class names
  - Making UITableViewCell and UICollectionViewCell reuse identifiers the same as their class name
  - Making UICollectionView supplementary views and UITableViewHeaderFooterView reuse identifiers the same as their class name
- Removes the need to force unwrap or force cast cells/headers as you dequeue
- Removes the need to force unwrap or force cast UIViewControllers as you instantiate them from a storyboard

If you're a user of SwiftLint, you'll greatly appreciate the reduced number of warnings and no more need for snippets in the vein of:

```swift
guard let cell = tableView.dequeueReusableCell(withIdentifier: "...", for: indexPath) as? MyCustomCellType else {
  fatalError("We didn't get the cell")
}
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Instantiation of a UIViewController From a Storyboard

Requires that a class has the same storyboard identifier as its class name.

```swift
let myStoryboard: UIStoryboard = ...
let myCustomViewController = myStoryboard.instantiateViewControllerOfType(MyCustomViewController.self) as MyCustomViewController
```

### Dequeueing and Registering a UITableViewCell

Requires that a class has the same reuse identifier as its class name. You must register your cell type first.

```swift
// Registration
tableView.register(MyCustomCellType.self)

// Dequeueing
let cell = tableView.dequeueReusableCell(for: indexPath) as MyCustomCellType
```

### Dequeueing and Registering a UICollectionViewCell

Requires that a class has the same reuse identifier as its class name. You must register your cell type first.

```swift
// Registration
collectionView.register(MyCustomCellType.self)

// Dequeueing
let cell = collectionView.dequeueReusableCell(for: indexPath) as MyCustomCellType
```

### Dequeueing and Registering a UITableViewHeaderFooterView

Requires that a class has the same reuse identifier as its class name. You must register your cell type first.

```swift
// Registration
tableView.register(MyCustomHeaderFooterView.self)

/// Dequeueing
let header = tableView.dequeueReusableHeaderFooterView(inSection: section) as MyCustomHeaderFooterView
```

### Dequeueing and Registering a UICollectionView Supplementary View

Requires that a class has the same reuse identifier as its class name. You must register your view type first.

```swift
// Registration
collectionView.register(MyCustomSupplementaryView.self, forSupplementaryViewElementOfKind: .sectionHeader) // or .sectionFooter

// Dequeueing
let view = collectionView.dequeueReusableSupplementaryView(ofKind: .sectionHeader, for: indexPath) as MyCustomSupplementaryView // also takes .sectionFooter
```

### Registering a view backed by a nib

Views backed by nibs must implement the `NibLoadableView` protocol. The protocol has a pre-defined extension, such that your view doesn't need to add any methods or properties.

```swift
class MyCoolCell: UITableViewCell, NibLoadableView {
  ...
}
```

## Installation

ReusableViews is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ReusableViews"
```

## Author

Hesham Salman, hesham8@gmail.com

Twitter: @WhatsASoftware

## License

ReusableViews is available under the MIT license. See the LICENSE file for more info.
