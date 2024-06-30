import SwiftUI

struct ShakeTextRenderer: TextRenderer {
    var shakeAmount: Double

    var animatableData: Double {
        get { shakeAmount }
        set { shakeAmount = newValue }
    }

    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        for line in layout {
            for run in line {
                for glyph in run {
                    var copy = context
                    let xOffset = Double.random(in: -shakeAmount...shakeAmount)
                    let yOffset = Double.random(in: -shakeAmount...shakeAmount)

                    copy.translateBy(x: xOffset, y: yOffset)
                    copy.draw(glyph, options: .disablesSubpixelQuantization)
                }
            }
        }
    }
}
