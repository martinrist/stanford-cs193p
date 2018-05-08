//
//  PlayingCardView.swift
//  PlayingCard
//
//  Created by Martin Rist on 04/05/2018.
//  Copyright © 2018 Martin Rist. All rights reserved.
//

import UIKit

class PlayingCardView: UIView {

  var rank: Int = 5 { didSet { setNeedsDisplay(); setNeedsLayout() } }
  var suit: String = "❤️" { didSet { setNeedsDisplay(); setNeedsLayout() } }
  var isFaceUp = true { didSet { setNeedsDisplay(); setNeedsLayout() } }

  private func centredAttributedString(_ string: String, fontSize: CGFloat) -> NSAttributedString {
    var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
    font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .center
    return NSAttributedString(string: string, attributes: [.paragraphStyle: paragraphStyle,
                                                           .font: font])
  }

  private var cornerString: NSAttributedString {
    return centredAttributedString(rankString + "\n" + suit, fontSize: cornerFontSize)
  }

  private lazy var upperLeftCornerLabel: UILabel = createCornerLabel()
  private lazy var lowerRightCornerLabel: UILabel = createCornerLabel()

  private func createCornerLabel() -> UILabel {
    let label = UILabel()
    label.numberOfLines = 0
    addSubview(label)
    return label
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    configureCornerLabel(upperLeftCornerLabel)
    upperLeftCornerLabel.frame.origin = bounds.origin.offsetBy(dx: cornerOffset, dy: cornerOffset)

    configureCornerLabel(lowerRightCornerLabel)
    lowerRightCornerLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    lowerRightCornerLabel.frame.origin = CGPoint(x: bounds.maxX, y: bounds.maxY)
      .offsetBy(dx: -cornerOffset, dy: -cornerOffset)
      .offsetBy(dx: -lowerRightCornerLabel.frame.size.width, dy: -lowerRightCornerLabel.frame.size.height)
  }

  private func configureCornerLabel(_ label: UILabel) {
    label.attributedText = cornerString

    // This ensures it sizes in both dimensions, not just height
    label.frame.size = .zero
    label.sizeToFit()

    label.isHidden = !isFaceUp
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    setNeedsDisplay()
    setNeedsLayout()
  }

  override func draw(_ rect: CGRect) {

    let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
    roundedRect.addClip()
    UIColor.white.setFill()
    roundedRect.fill()

  }

}


extension PlayingCardView {

  private struct SizeRatio {
    static let cornerFontSizeToBoundsHeight: CGFloat = 0.085
    static let cornerRadiusToBoundsHeight: CGFloat = 0.06
    static let cornerOffsetToCornerRadius: CGFloat = 0.33
    static let faceCardImageSizeToBoundsSize: CGFloat = 0.75
  }

  private var cornerRadius: CGFloat {
    return bounds.size.height * SizeRatio.cornerFontSizeToBoundsHeight
  }

  private var cornerOffset: CGFloat {
    return cornerRadius * SizeRatio.cornerOffsetToCornerRadius
  }

  private var cornerFontSize: CGFloat {
    return bounds.size.height * SizeRatio.cornerFontSizeToBoundsHeight
  }

  private var rankString: String {
    switch rank {
    case 1: return "A"
    case 2...10: return String(rank)
    case 11: return "J"
    case 12: return "Q"
    case 13: return "A"
    default: return "?"
    }
  }
}


extension CGRect {
  var leftHalf: CGRect {
    return CGRect(x: minX, y: minY, width: width / 2, height: height / 2)
  }
  var rightHalf: CGRect {
    return CGRect(x: midX, y: midY, width: width / 2, height: height / 2)
  }
  func inset(by size: CGSize) -> CGRect {
    return insetBy(dx: size.width, dy: size.height)
  }
  func sized(to size: CGSize) -> CGRect {
    return CGRect(origin: origin, size: size)
  }
  func zoom(by scale: CGFloat) -> CGRect {
    let newWidth = width * scale
    let newHeight = height * scale
    return insetBy(dx: (width - newWidth) / 2, dy: (height - newHeight) / 2)
  }
}

extension CGPoint {
  func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
    return CGPoint(x: x + dx, y: y + dy)
  }
}
