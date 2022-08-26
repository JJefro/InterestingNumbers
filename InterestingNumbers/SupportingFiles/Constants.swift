//
//  Constants.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 08/08/2022.
//

import Foundation

struct Constants {
    struct Components {
        static var numbersURLComponents: URLComponents {
            var components = URLComponents()
            components.scheme = "http"
            components.host = "numbersapi.com"
            components.queryItems = [URLQueryItem(name: "json", value: "")]
            return components
        }
    }
}
