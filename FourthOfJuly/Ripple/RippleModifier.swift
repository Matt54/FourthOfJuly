import SwiftUI

struct RippleModifier: ViewModifier {
    var origin: CGPoint
    var elapsedTime: TimeInterval
    
    var amplitude: Double
    var frequency: Double

    var speed: Double = 1200

    func body(content: Content) -> some View {
        let shader = ShaderLibrary.Ripple(
            .float2(origin),
            .float(elapsedTime),

            // Parameters
            .float(amplitude),
            .float(frequency),
            .float(speed)
        )

        let maxSampleOffset = maxSampleOffset

        content.visualEffect { view, _ in
            view.layerEffect(
                shader,
                maxSampleOffset: maxSampleOffset,
                isEnabled: true
            )
        }
    }

    var maxSampleOffset: CGSize {
        CGSize(width: amplitude, height: amplitude)
    }
}
