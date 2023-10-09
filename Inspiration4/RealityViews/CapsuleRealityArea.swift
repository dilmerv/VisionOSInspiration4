//
//  CapsuleRealityArea.swift
//  Inspiration4
//
//  Created by Dilmer Valecillos on 9/16/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct CapsuleRealityArea: View {
    
    @Environment(ViewModel.self) private var model
    @State private var capsule: Entity?
    let attachmentID = "attachmentID"
    
    var body: some View {
        RealityView { content, attachments in
            guard let entity = try? await Entity(named: "Scene", in: realityKitContentBundle) else {
                fatalError("Unable to load scene model")
            }
            content.add(entity)
            
            self.capsule = entity
            self.capsule?.setSunlight(intensity: 13)
            self.capsule?.components.set(OrbitComponent(radius: 0.02, speed: 0, addOrientationRotation: true))
            
            if let sceneAttachment = attachments.entity(for: attachmentID) {
                sceneAttachment.position = SIMD3<Float>(-0.2, -0.1, 0.1)
                sceneAttachment.transform.rotation = simd_quatf(angle: -0.5, axis: SIMD3<Float>(1,0,0))
                content.add(sceneAttachment)
            }
        } update: { content, attachments in
            print("RealityView changes detected...")
            
        } placeholder: {
            ProgressView()
                .progressViewStyle(.circular)
                .controlSize(.large)
        } attachments: {
            Attachment(id: attachmentID){
                CapsuleDetails {
                    self.capsule?.setSunlight(intensity: 13)
                } turnOffLight: {
                    self.capsule?.setSunlight(intensity: 6)
                } turnOnOrbit: {
                    self.capsule?.components[OrbitComponent.self]?.speed = 1
                } turnOffOrbit: {
                    self.capsule?.components[OrbitComponent.self]?.speed = 0
                }
            }
        }
        .onDisappear {
            model.isShowingRocketCapsule = false
        }
    }
}

#Preview {
    CapsuleRealityArea()
        .environment(ViewModel())
}
