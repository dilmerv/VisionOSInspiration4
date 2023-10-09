//
//  Areas.swift
//  Inspiration4
//
//  Created by Dilmer Valecillos on 9/15/23.
//

import SwiftUI

struct Areas: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        ZStack {
            NavigationStack {
                NavigationToAreas()
            }
        }
        
        .onChange(of: scenePhase) { _, newScenePhase in
            if (model.isShowingFullRocket || model.isShowingMixedRocket) && newScenePhase == .background {
                Task {
                    await dismissImmersiveSpace();
                }
            }
        }
    }
}

#Preview {
    Areas()
}
