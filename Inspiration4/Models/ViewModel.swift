//
//  ViewModel.swift
//  Inspiration4
//
//  Created by Dilmer Valecillos on 9/16/23.
//

import Foundation

@Observable
class ViewModel
{
    var navigationPath : [Area] = []
    var isShowingRocketCapsule : Bool = false
    var isShowingFullRocket : Bool = false
    var isShowingMixedRocket : Bool = false
    
    var capsuleRealityAreaId: String = "CapsuleRealityArea"
    var fullRocketRealityArea: String = "FullRocketRealityArea"
    var mixedRocketRealityArea: String = "MixedRocketRealityArea"
}
