//
//  UICollectionView+Extensions.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 08/08/2022.
//

import UIKit

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable UICollectionViewCell")
        }
        return cell
    }
}
