//
//  ApplyableProtocol.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 05/07/2022.
//

import UIKit

/// Protocol for adding useful functions in a simple way.
protocol ApplyableProtocol {}

extension ApplyableProtocol where Self: AnyObject {
    /// Calls the specified closure with Self value as its receiver and returns Self value.
    ///
    /// - Parameter item: Closure to apply.
    /// - Returns: Return Self object.
    @discardableResult
    func apply(_ item: (Self) throws -> Void) rethrows -> Self {
        try item(self)
        return self
    }

    /// Calls the specified closure with Self value as its argument and returns closure result.
    ///
    /// - Parameter item: Closure to apply.
    /// - Returns: Closure result.
    func `let`<R>(_ item: (Self) throws -> R) rethrows -> R {
        try item(self)
    }
}

extension NSObject: ApplyableProtocol {}
