//
//  IslandCompassWidget.swift
//  IslandCompassWidget
//
//  Created by Nick Molargik on 9/21/22.
//

import WidgetKit
import SwiftUI
import ActivityKit

@main
struct Widgets: WidgetBundle {
    var body: some Widget {
        if #available(iOS 16.1, *) {
            IslandCompassApp()
        }
    }
}

@available(iOSApplicationExtension 16.1, *)
struct IslandCompassApp: Widget {
    let kind: String = "IslandCompassWidget"

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: HeadingAttributes.self) { context in
            LockScreenView(context: context)
            //LockScreenView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    dynamicIslandExpandedLeadingView(context: context)
                }
                
                DynamicIslandExpandedRegion(.trailing) {
                    dynamicIslandExpandedTrailingView(context: context)
                }
                
                DynamicIslandExpandedRegion(.center) {
                    dynamicIslandExpandedCenterView(context: context)
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    dynamicIslandExpandedBottomView(context: context)
                }
            } compactLeading: {
                compactLeadingView(context: context)
            } compactTrailing: {
                compactTrailingView(context: context)
            } minimal: {
                VStack (alignment: .center) {
                    Image(systemName: "arrow.up")
                    Text("\(context.state.angle)°")
            
                }
            }
            .keylineTint(.cyan)
        }
    }
    
    // Expanded Dynamic Island Views
    func dynamicIslandExpandedLeadingView(context: ActivityViewContext<HeadingAttributes>) -> some View {
        VStack (alignment: .center) {
            Label {
                Text("\(context.state.heading)")
            } icon: {
                Image(systemName: "arrow.up")
                    .foregroundColor(.green)
            }
            .multilineTextAlignment(.center)
        }
    }
    
    func dynamicIslandExpandedTrailingView(context: ActivityViewContext<HeadingAttributes>) -> some View {
        VStack (alignment: .center) {
            Label {
                Text("\(context.state.heading)")
            } icon: {
                Image(systemName: "arrow.up")
                    .foregroundColor(.green)
            }
            .multilineTextAlignment(.center)
        }
    }
    
    func dynamicIslandExpandedBottomView(context: ActivityViewContext<HeadingAttributes>) -> some View {
        VStack (alignment: .center) {
            Label {
                Text("\(context.state.heading)")
            } icon: {
                Image(systemName: "arrow.up")
                    .foregroundColor(.green)
            }
            .multilineTextAlignment(.center)
        }
    }
    
    func dynamicIslandExpandedCenterView(context: ActivityViewContext<HeadingAttributes>) -> some View {
        VStack (alignment: .center) {
            Label {
                Text("\(context.state.heading)")
            } icon: {
                Image(systemName: "arrow.up")
                    .foregroundColor(.green)
            }
            .multilineTextAlignment(.center)
        }
    }
    
    // Compact Dynamic Island Views
    
    func compactLeadingView(context: ActivityViewContext<HeadingAttributes>) -> some View {
        VStack {
            Text("\(context.state.heading)")
                .frame(width: 40)
                .multilineTextAlignment(.center)
                .font(.caption2)
            
        }
    }
    
    func compactTrailingView(context: ActivityViewContext<HeadingAttributes>) -> some View {
        VStack {
            Text("\(context.state.heading)")
                .frame(width: 40)
                .multilineTextAlignment(.center)
                .font(.caption2)
        }
    }
}
