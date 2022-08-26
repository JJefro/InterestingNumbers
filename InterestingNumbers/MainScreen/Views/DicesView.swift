//
//  DicesView.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 24/07/2022.
//

import Foundation
import UIKit

class DicesView: UIView {

    private enum PositionX {
        case left, center, right
    }

    private enum PositionY {
        case top, center, bottom
    }

    private let bgColor: UIColor
    private let cornerRadius: CGFloat = 15
    
    public var backgroundDiceNumber = 5
    public var foregroundDiceNumber = 6

    init(backgroundColor: UIColor) {
        self.bgColor = backgroundColor
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        bgColor.setFill()
        UIRectFill(rect)

        let backgroundDiceRect = CGRect(x: rect.midX, y: rect.midY, width: rect.width / 2, height: rect.height / 2)
        let foregroundDiceRect = CGRect(x: rect.minX, y: rect.minY, width: rect.width / 2, height: rect.height / 2)

        getDicePath(in: backgroundDiceRect, number: backgroundDiceNumber).apply {
            var transform: CGAffineTransform = .identity
            transform = transform.translatedBy(x: -rect.width / 60, y: -rect.height / 10)
            $0.apply(transform)
            $0.fill(color: R.color.dicesBgColor()!)
            $0.stroke(color: R.color.dicesTintColor()!)
        }

        getDicePath(in: foregroundDiceRect, number: foregroundDiceNumber).apply {
            var transform: CGAffineTransform = .identity
            transform = transform.translatedBy(x: rect.width / 2.85, y: rect.height / 20)
            transform = transform.rotated(by: .pi / 4)
            $0.apply(transform)
            $0.fill(color: R.color.dicesBgColor()!)
            $0.stroke(color: R.color.dicesTintColor()!)
        }
    }
}

// MARK: - Private Methods
private extension DicesView {
    func getDicePath(in rect: CGRect, number: Int) -> UIBezierPath {
        let dicePath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        dicePath.append(getDiceDotPath(in: rect, with: number))
        dicePath.lineWidth = rect.width / 15
        return dicePath
    }

    func getDiceDotPath(in rect: CGRect, with number: Int) -> UIBezierPath {
        assert(1...6 ~= number, "Dice with such number is not implemented")
        let dotsPath = UIBezierPath()
        switch number {
        case 1:
            dotsPath.append(getDotPath(in: rect, positionX: .center, positionY: .center))
        case 2:
            dotsPath.append(getDotPath(in: rect, positionX: .right, positionY: .top))
            dotsPath.append(getDotPath(in: rect, positionX: .left, positionY: .bottom))
        case 3:
            dotsPath.append(getDotPath(in: rect, positionX: .right, positionY: .top))
            dotsPath.append(getDotPath(in: rect, positionX: .center, positionY: .center))
            dotsPath.append(getDotPath(in: rect, positionX: .left, positionY: .bottom))
        case 4:
            dotsPath.append(getDotPath(in: rect, positionX: .left, positionY: .top))
            dotsPath.append(getDotPath(in: rect, positionX: .right, positionY: .top))
            dotsPath.append(getDotPath(in: rect, positionX: .left, positionY: .bottom))
            dotsPath.append(getDotPath(in: rect, positionX: .right, positionY: .bottom))
        case 5:
            dotsPath.append(getDotPath(in: rect, positionX: .left, positionY: .top))
            dotsPath.append(getDotPath(in: rect, positionX: .right, positionY: .top))
            dotsPath.append(getDotPath(in: rect, positionX: .center, positionY: .center))
            dotsPath.append(getDotPath(in: rect, positionX: .left, positionY: .bottom))
            dotsPath.append(getDotPath(in: rect, positionX: .right, positionY: .bottom))
        default:
            dotsPath.append(getDotPath(in: rect, positionX: .left, positionY: .top))
            dotsPath.append(getDotPath(in: rect, positionX: .right, positionY: .top))
            dotsPath.append(getDotPath(in: rect, positionX: .left, positionY: .center))
            dotsPath.append(getDotPath(in: rect, positionX: .right, positionY: .center))
            dotsPath.append(getDotPath(in: rect, positionX: .left, positionY: .bottom))
            dotsPath.append(getDotPath(in: rect, positionX: .right, positionY: .bottom))
        }
        return dotsPath
    }

    private func getDotPath(in rect: CGRect, positionX: PositionX, positionY: PositionY) -> UIBezierPath {
        var xPosition = CGFloat()
        var yPosition = CGFloat()

        switch positionX {
        case .left: xPosition = rect.midX - rect.width / 4
        case .center: xPosition = rect.midX
        case .right: xPosition = rect.midX + rect.width / 4
        }

        switch positionY {
        case .top: yPosition = rect.midY - rect.height / 4
        case .center: yPosition = rect.midY
        case .bottom: yPosition = rect.midY + rect.height / 4
        }

        return getCirclePath(arcCenter: CGPoint(x: xPosition, y: yPosition), radius: rect.width / 30)
    }

    func getCirclePath(arcCenter: CGPoint, radius: CGFloat) -> UIBezierPath {
        UIBezierPath(
            arcCenter: arcCenter,
            radius: radius,
            startAngle: 0,
            endAngle: 2 * .pi,
            clockwise: true)
    }
}

// MARK: - PreviewProvider
#if DEBUG
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, *)
struct DicesViewRepresentablePreview: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content:
                    Representable(view: DicesView(
                        backgroundColor: R.color.mainViewBG()!
                    ))
                        .frame(
                            width: 350,
                            height: 350,
                            alignment: .center
                        )
                            .previewLayout(.sizeThatFits)
                            .preferredColorScheme)
    }
}
#endif
#endif
