//
//  Inspiration4App.swift
//  Inspiration4
//
//  Created by Dilmer Valecillos on 9/14/23.
//

import SwiftUI

@main
struct Inspiration4App: App {
    
    @State private var model = ViewModel()
    
    var body: some Scene {
        
        // The main area view
        WindowGroup("Main Areas", id: "Areas") {
            Areas()
                .environment(model)
        }
        //.windowStyle(.plain)
        //.defaultSize(CGSize(width: 200, height: 150))
        //.defaultSize(width: 0.6, height: 0.3, depth: 0.6, in: .meters)
        
        WindowGroup(id: "CapsuleRealityArea"){
            CapsuleRealityArea()
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.6, height: 0.6, depth: 0.6, in: .meters)
        
        ImmersiveSpace(id: "FullRocketRealityArea"){
            FullRocketRealityArea()
        }
        .immersionStyle(selection: .constant(.full), in: .full)
    }
}
