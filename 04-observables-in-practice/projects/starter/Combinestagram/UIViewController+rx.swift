//
//  UIViewController+rx.swift
//  Combinestagram
//
//  Created by Icung on 19/09/23.
//  Copyright © 2023 Underplot ltd. All rights reserved.
//

import UIKit
import RxSwift

extension UIViewController {
  func alert(title: String, text: String?) -> Completable {
    return Completable.create { [weak self] completed in
      let alertVC = UIAlertController(title: title, message: text, preferredStyle: .alert)
      alertVC.addAction(UIAlertAction(title: "Close", style: .default, handler: { _ in
        completed(.completed)
      }))
      self?.present(alertVC, animated: true)
      
      return Disposables.create { [weak self] in
        self?.dismiss(animated: true)
      }
    }
  }
}
