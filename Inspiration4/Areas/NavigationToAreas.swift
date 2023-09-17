//
//  NavigationToAreas.swift
//  Inspiration4
//
//  Created by Dilmer Valecillos on 9/16/23.
//

import SwiftUI

struct NavigationToAreas: View {
    var body: some View {
        VStack {
            Text("Welcome To Inspiration4 Mission By SpaceX")
                .monospaced()
                .font(.system(size: 40, weight: .bold))
                .padding(.top, 250)
            
            HStack(spacing: 25) {
                ForEach(Area.allCases) { area in
                    NavigationLink {
                        // navigation link destination area
                        
                        // header area
                        Text(area.title)
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                        
                        // sub-views go here
                        if area == Area.astronauts {
                            CrewArea()
                        }
                        else if area == Area.equipment {
                            EquipmentArea()
                        }
                        else if area == Area.mission {
                            MissionArea()
                        }
                        
                        Spacer()
                    } label: {
                        Label(area.name, systemImage: "chevron.right")
                            .monospaced()
                            .font(.title)
                    }
                    .controlSize(.extraLarge)
                }
            }
        }
        .background()
        {
            Image("Inspiration4")
        }
    }
}

#Preview {
    NavigationToAreas()
        .environment(ViewModel())
}
