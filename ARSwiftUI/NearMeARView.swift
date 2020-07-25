//
//  NearMeARView.swift
//  ARSwiftUI
//
//  Created by Felix Qiang on 7/19/20.
//  Copyright © 2020 Felix Qiang. All rights reserved.
//

import SwiftUI
import RealityKit

struct NearMeARView: View {
    var body: some View {


         return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}


struct ARViewContainer: UIViewRepresentable {

    func makeUIView(context: Context) -> ARView {

        let arView = ARView(frame: .zero)

        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()

        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)

        return arView

    }

    func updateUIView(_ uiView: ARView, context: Context) {}

}

struct NearMeARView_Previews: PreviewProvider {
    static var previews: some View {
        NearMeARView()
    }
}
