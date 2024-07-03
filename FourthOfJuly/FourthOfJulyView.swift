import SwiftUI
import Vortex

struct FourthOfJulyView: View {
    var body: some View {
        ZStack {
            VStack {
                FlagView()
                TextView()
            }
            ParticleSystem()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .preferredColorScheme(.dark)
    }
    
    struct FlagView: View {
        let referenceDate = Date.now
        
        var body: some View {
            TimelineView(.animation) { context in
                let time = context.date.timeIntervalSince(referenceDate) * 0.1
                Image("USA")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .modifier(RippleModifier(origin: .zero, elapsedTime: time, amplitude: 2, frequency: 100))
            }
        }
    }
    
    struct TextView: View {
        @State private var textShakeAmount = 0.25
        
        var body: some View {
            Text("HAPPY 4TH OF JULY")
                .font(.largeTitle)
                .bold()
                .textRenderer(ShakeTextRenderer(shakeAmount: textShakeAmount))
                .onAppear {
                    withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                        textShakeAmount = 0.5
                    }
                }
        }
    }
    
    struct ParticleSystem: View {
        let height = UIScreen.main.bounds.height
        
        var body: some View {
            ZStack {
                VortexView(.fireworkShow) {
                    Circle()
                        .fill(.white)
                        .blendMode(.plusLighter)
                        .frame(width: 18)
                        .tag("circle")
                }
                .offset(y: -height*0.25)
                
                VortexView(.fountain) {
                    Circle()
                        .fill(.white)
                        .blendMode(.plusLighter)
                        .frame(width: 18)
                        .tag("circle")
                }
                .offset(y: height*0.5 - 50)
                
                VortexView(.fountain) {
                    Circle()
                        .fill(.white)
                        .blendMode(.plusLighter)
                        .frame(width: 18)
                        .tag("circle")
                }
                .offset(y: height*0.5 - 50)
                .scaleEffect(x: -1, y: 1, anchor: .center)
            }
        }
    }
}

#Preview {
    FourthOfJulyView()
}
