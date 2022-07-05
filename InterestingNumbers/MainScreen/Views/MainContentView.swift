//
//  MainContentView.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 05/07/2022.
//

import UIKit

protocol MainContentViewProtocol: UIView {}

class MainContentView: UIView, MainContentViewProtocol {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if DEBUG
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, *)
struct MainContentViewRepresentablePreview: PreviewProvider {
    static var previews: some View {
        Representable(view: MainContentView())
            .frame(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height,
                alignment: .center
            )
            .previewLayout(.sizeThatFits)
    }
}
#endif
#endif
