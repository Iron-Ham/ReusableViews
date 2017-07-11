//
//  UIStoryboardExtensions.swift
//  ReusableViews
//
//  Created by Hesham Salman on 5/11/17.
//
//

import Foundation

public extension UIStoryboard {
  /// Instantiates and returns a UIViewController whose storyboard identifier is the same as its class name
  ///
  /// Does not require banging the 'as' since that's implicitly handled by this method.
  ///
  /// - Parameter _: UIViewController Type
  /// - Returns: UIViewController
  func instantiateViewControllerOfType<ViewController: UIViewController>(_: ViewController.Type) -> ViewController
    where ViewController: StoryboardCompatibleView {
      guard let viewController = instantiateViewController(withIdentifier: ViewController.storyboardIdentifier) as? ViewController else {
        fatalError("Could not instantiate view controller with identifier: \(ViewController.storyboardIdentifier)")
      }
      return viewController
  }

}
