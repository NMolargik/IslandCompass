//
//  Markers.swift
//  IslandCompass
//
//  Created by Nick Molargik on 9/21/22.
//

import Foundation

struct Marker: Hashable {
    let degrees: Double
    let label: String
    
    init (degrees: Double, label: String = "") {
        self.degrees = degrees
        self.label = label
    }
    
    static func markers() -> [Marker] {
        return [
            Marker(degrees: 0, label: "S"),
            Marker(degrees: 22.5),
            Marker(degrees: 45, label: "SW"),
            Marker(degrees: 67.5),
            Marker(degrees: 90, label: "W"),
            Marker(degrees: 112.5),
            Marker(degrees: 135, label: "NW"),
            Marker(degrees: 157.5),
            Marker(degrees: 180, label: "N"),
            Marker(degrees: 202.5),
            Marker(degrees: 225, label: "NE"),
            Marker(degrees: 247.5),
            Marker(degrees: 270, label: "E"),
            Marker(degrees: 292.5),
            Marker(degrees: 315, label: "SE"),
            Marker(degrees: 337.5)
        ]
    }
    
    func degreeText() -> String {
        if (self.degrees.remainder(dividingBy: 1)==0) {
            return String(format: "%.0f", self.degrees)
        } else {
            return String(format: "%.1f", self.degrees)
        }
        
    }
}
