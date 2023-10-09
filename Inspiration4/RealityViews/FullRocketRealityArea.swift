//
//  FullRocketRealityArea.swift
//  Inspiration4
//
//  Created by Dilmer Valecillos on 9/16/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FullRocketRealityArea: View {
    
    @State private var audioController: AudioPlaybackController?
    
    var body: some View {
        RealityView { content in
            guard let entity = try? await Entity(named: "Immersive", in: realityKitContentBundle) else {
                fatalError("Unable to load immersive model")
            }
            
            let ambientAudioEntity = entity.findEntity(named: "AmbientAudio")
            
            guard let resource = try? await AudioFileResource(named: "/Root/Space_wav", from: "Immersive.usda", in: realityKitContentBundle) else {
                fatalError("Unable to load space.wav audio resource")
            }
            
            ambientAudioEntity?.ambientAudio?.gain = -30;
            audioController = ambientAudioEntity?.prepareAudio(resource)
            audioController?.play()
            
            
            // find rocket and apply orbit component
            if let rocket = entity.findEntity(named: "Rocket"){
                rocket.components.set(OrbitComponent(radius: 0.02, speed: 0.5, addOrientationRotation: true))
            }
            
            content.add(entity)
        }
        .onDisappear(perform: {
            audioController?.stop()
        })
    }
}

#Preview {
    FullRocketRealityArea()
}
