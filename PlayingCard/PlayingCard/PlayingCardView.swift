//
//  PlayingCardView.swift
//  PlayingCard
//
//  Created by Martin Rist on 04/05/2018.
//  Copyright © 2018 Martin Rist. All rights reserved.
//

import UIKit

class PlayingCardView: UIView {

  private func centredAttributedString(_ string: String, fontSize: CGFloat) -> NSAttributedString {
    var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
    font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
    let paragraphStyle = NSMutableParagraphStyle()




  }

  override func draw(_ rect: CGRect) {

    let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
    roundedRect.addClip()
    UIColor.white.setFill()
    roundedRect.fill()



  }

}
