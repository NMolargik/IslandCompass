//
//  CompassMarkerView.swift
//  IslandCompass
//
//  Created by Nick Molargik on 9/21/22.
//

import SwiftUI

struct CompassMarkerView: View {
    let marker: Marker
    let compassDegrees: Double
    
    var body: some View {
        VStack {
            Text(marker.degreeText())
                .fontWeight(.light)
                .rotationEffect(self.textAngle())
            
            
            Capsule()
                .frame(width: self.capsuleWidth(), height: self.capsuleHeight())
                .foregroundColor(self.capsuleColor())
                .padding(.bottom, 120)
            
            Text(marker.label)
                .fontWeight(.bold)
                .rotationEffect(self.textAngle())
                .padding(.bottom, 80)
                .scaleEffect(self.textSize())
        }
        .rotationEffect(Angle(degrees: marker.degrees))
    }
    
    private func capsuleWidth() -> CGFloat {
        return self.marker.degrees == 0 ? 7 : 3
    }
    
    private func capsuleHeight() -> CGFloat {
        return self.marker.degrees == 0 ? 45 : 30
    }
    
    private func capsuleColor() -> Color {
        return self.marker.degrees == 0 ? .red : .gray
    }
    
    private func textAngle() -> Angle {
        return Angle(degrees: -self.compassDegrees - self.marker.degrees)
    }
    
    private func textSize() -> CGFloat {
        switch (self.marker.degrees) {
        case (45):
            return 0.7
        case (135):
            return 0.7
        case (225):
            return 0.7
        case (315):
            return 0.7
        default:
            return 1.0
        }
    }
}

struct CompassMarkerView_Previews: PreviewProvider {
    static var previews: some View {
        CompassMarkerView(marker: Marker(degrees: 45), compassDegrees: 0)
    }
}
