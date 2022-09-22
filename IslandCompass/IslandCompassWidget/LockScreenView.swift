//
//  LockScreenView.swift
//  IslandCompass
//
//  Created by Nick Molargik on 9/21/22.
//

import SwiftUI
import ActivityKit
import WidgetKit

@available(iOSApplicationExtension 16.1, *)
struct LockScreenView: View {
    let context: ActivityViewContext<HeadingAttributes>
    var body: some View {
        VStack {
            Spacer()
            
            Text("\(context.state.angle)°")
            
            Text("Heading: \(context.state.heading)")
            
            Spacer()
        }
        .activitySystemActionForegroundColor(.indigo)
        .activityBackgroundTint(.cyan)
    }
}

//struct LockScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        LockScreenView(context: ActivityViewContext<HeadingAttributes>)
//    }
//}
