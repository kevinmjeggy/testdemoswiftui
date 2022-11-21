//
//  Lottie.swift
//  Kevin_Test
//
//  Created by Kevin on 20/11/22.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    typealias UIViewType = UIView
    let filename: String
    let animationView = LottieAnimationView()
    let isPaused: Bool

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animation = LottieAnimation.named(filename)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        if isPaused {
            context.coordinator.parent.animationView.pause()
        } else {
            context.coordinator.parent.animationView.play()

        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: LottieView

        init(_ parent: LottieView) {
            self.parent = parent
        }
    }
}

struct LoadLottie: View {
    @Binding var play: Bool
    var fileName: String
    var width: CGFloat = 60
    var height: CGFloat = 60
    var body: some View {
        VStack {
            LottieView(filename: fileName, isPaused: play)
                .frame(width: width, height: height, alignment: .center)
        }
    }
}


struct LoadLottie_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            LoadLottie(play: .constant(true), fileName: "like")
        }
    }
}
