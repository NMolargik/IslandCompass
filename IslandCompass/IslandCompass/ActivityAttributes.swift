//
//  ActivityAttributes.swift
//  IslandCompass
//
//  Created by Nick Molargik on 9/21/22.
//

import Foundation
import ActivityKit

struct HeadingAttributes: ActivityAttributes, Identifiable {
    public typealias LiveHeadingData = ContentState
    
    public struct ContentState: Codable, Hashable {
        var angle: CGFloat
        var heading: String
    }
    
    var id = UUID()
}
