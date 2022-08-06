//
//  MainContentView.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 05/07/2022.
//

import UIKit
import SnapKit

protocol MainContentViewProtocol: UIView {}

final class MainContentView: UIView, MainContentViewProtocol {

    private let titleLabel = UILabel().apply {
        $0.text = R.string.localizable.mainView_title()
        $0.font = R.font.openSansBold(size: 28)
        $0.textColor = R.color.textColor()
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    private let descriptionLabel = UILabel().apply {
        $0.text = R.string.localizable.mainView_description()
        $0.font = R.font.openSansLight(size: 16)
        $0.textColor = R.color.textColor()
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    private let dicesView = DicesView(dicesTintColor: R.color.dicesTintColor()!,
                                      dicesBgColor: R.color.dicesBgColor()!,
                                      backgroundColor: R.color.mainViewBG()!
    )
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Add Views
private extension MainContentView {
    func addViews() {
        addTitleLabel()
        addDescriptionLabel()
        addDicesView()
    }
    func addTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(88)
            $0.centerX.equalToSuperview()
        }
    }
    func addDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(66)
        }
    }
    func addDicesView() {
        addSubview(dicesView)
        dicesView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(self.snp.width).dividedBy(2)
            $0.width.equalTo(dicesView.snp.height)
        }
    }
}
// MARK: - Configurations
private extension MainContentView {

    func configure() {
        backgroundColor = R.color.mainViewBG()
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
