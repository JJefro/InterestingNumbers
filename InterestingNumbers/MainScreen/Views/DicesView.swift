//
//  DicesView.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 24/07/2022.
//

import Foundation

class DicesView: UIView {

    private let dicesTintColor: UIColor
    private let dicesBgColor: UIColor
    private let bgColor: UIColor
    private let cornerRadius: CGFloat = 15

    init(dicesTintColor: UIColor, dicesBgColor: UIColor, backgroundColor: UIColor) {
        self.dicesTintColor = dicesTintColor
        self.dicesBgColor = dicesBgColor
        self.bgColor = backgroundColor
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        bgColor.setFill()
        UIRectFill(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let dices = [getDiceWithNumberOnePath(), getDiceWithNumberFivePath()]

        for dice in dices {
            dice.lineWidth = bounds.width / 30
        }
        context.setFillColor(dicesBgColor.cgColor)
        context.setStrokeColor(dicesTintColor.cgColor)
        for dice in dices {
            dice.fill()
            dice.stroke()
        }
    }
}

// MARK: - Dices UIBezierPath
private extension DicesView {
    func getDiceWithNumberOnePath() -> UIBezierPath {
        let dicePath = getRoundedRectanglePath(
            xPosition: bounds.midX,
            yPosition: bounds.midY
        )
        let centralCirclePoint = CGPoint(x: bounds.maxX - (bounds.midX / 2), y: bounds.maxY - (bounds.maxY / 4))
        dicePath.append(getCirclePath(arcCenter: centralCirclePoint))
        dicePath.apply(CGAffineTransform(translationX: -bounds.width / 60,
                                         y: -bounds.width / 60))
        return dicePath
    }

    func getDiceWithNumberFivePath() -> UIBezierPath {
        let dicePath = getRoundedRectanglePath(
            xPosition: bounds.minX,
            yPosition: bounds.minY
        )
        let leftPositionX = bounds.midX / 4
        let rightPositionX = bounds.midX - (bounds.midX / 4)
        let bottomPositionY = bounds.midY - (bounds.midY / 4)
        let topPositionY = bounds.midY / 4
        let centerPosition = CGPoint(x: bounds.midX / 2, y: bounds.midY / 2)

        dicePath.append(getCirclePath(
            arcCenter: CGPoint(x: leftPositionX, y: topPositionY)))
        dicePath.append(getCirclePath(
            arcCenter: CGPoint(x: rightPositionX, y: topPositionY)))
        dicePath.append(getCirclePath(arcCenter: centerPosition))
        dicePath.append(getCirclePath(
            arcCenter: CGPoint(x: leftPositionX, y: bottomPositionY)))
        dicePath.append(getCirclePath(
            arcCenter: CGPoint(x: rightPositionX, y: bottomPositionY)))

        dicePath.apply(CGAffineTransform(rotationAngle: .pi / 4))
        dicePath.apply(CGAffineTransform(translationX: bounds.width / 2.7,
                                         y: bounds.height / 7))
        return dicePath
    }

    func getRoundedRectanglePath(xPosition: CGFloat, yPosition: CGFloat) -> UIBezierPath {
        UIBezierPath(
            roundedRect: CGRect(
                x: xPosition,
                y: yPosition,
                width: bounds.width / 2,
                height: bounds.height / 2
            ),
            cornerRadius: cornerRadius
        )
    }

    func getCirclePath(arcCenter: CGPoint) -> UIBezierPath {
        UIBezierPath(
            arcCenter: arcCenter,
            radius: bounds.width / 60,
            startAngle: 0,
            endAngle: 2 * .pi,
            clockwise: true
        )
    }
}

// MARK: - PreviewProvider
#if DEBUG
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, *)
struct DicesViewRepresentablePreview: PreviewProvider {
    static var previews: some View {
        Representable(view: DicesView(dicesTintColor: .black, dicesBgColor: .red, backgroundColor: .white))
        .frame(
            width: 350,
            height: 350,
            alignment: .center
        )
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)
    }
}
#endif
#endif
