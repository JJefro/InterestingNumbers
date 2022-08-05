//
//  DicesView.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 24/07/2022.
//

import Foundation

class DicesView: UIView {

    private let dicesTintColor: UIColor
    private let bgColor: UIColor
    private let cornerRadius: CGFloat = 15

    init(dicesTintColor: UIColor, bgColor: UIColor) {
        self.dicesTintColor = dicesTintColor
        self.bgColor = bgColor
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        addDiceWithNumberOne()
        addDiceWithNumberFive()
    }
}

// MARK: - Private Methods
private extension DicesView {
    func addDiceWithNumberOne() {
        let dicePath = getRoundedRectanglePath(
            xPosition: bounds.midX,
            yPosition: bounds.midY
        )
        let centralCirclePoint = CGPoint(x: bounds.maxX - (bounds.midX / 2), y: bounds.maxY - (bounds.maxY / 4))
        dicePath.append(getCirclePath(arcCenter: centralCirclePoint))
        addShapeLayer(with: dicePath)
    }

    func addDiceWithNumberFive() {
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

        let translation = CGAffineTransform(translationX: bounds.width / 3, y: bounds.height / 6)
        dicePath.apply(CGAffineTransform(rotationAngle: .pi / 4))
        dicePath.apply(translation)
        addShapeLayer(with: dicePath)
    }

    func getRoundedRectanglePath(xPosition: CGFloat, yPosition: CGFloat) -> UIBezierPath {
        return UIBezierPath(
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
        let circlePath = UIBezierPath(
            arcCenter: arcCenter,
            radius: bounds.width / 60,
            startAngle: 0,
            endAngle: 2 * .pi,
            clockwise: true
        )
        return circlePath
    }

    func addShapeLayer(with path: UIBezierPath) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = bounds.width / 30
        shapeLayer.fillColor = bgColor.cgColor
        shapeLayer.strokeColor = dicesTintColor.cgColor
        layer.addSublayer(shapeLayer)
    }
}

#if DEBUG
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, *)
struct DicesViewRepresentablePreview: PreviewProvider {
    static var previews: some View {
        Representable(view: DicesView(dicesTintColor: .black, bgColor: .red))
            .frame(
                width: 350,
                height: 350,
                alignment: .center
            )
            .previewLayout(.sizeThatFits)
    }
}
#endif
#endif
