//
//  ContentView.swift
//  IslandCompass
//
//  Created by Nick Molargik on 9/21/22.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    
    @Environment(\.scenePhase) var scenePhase // Know when app moves to background
    @ObservedObject var compassHeading = CompassHeading()
    @State var activities = Activity<HeadingAttributes>.activities
    
    var activityAuth = ActivityAuthorizationInfo()
    
    var body: some View {
        VStack {
            Image(systemName: "chevron.compact.up")
                .padding(.bottom, 10)
                .foregroundColor(.gray)
            
            Text("Dismiss app to start live activity")
                .padding(.bottom, 30)
                .foregroundColor(.gray)
                .onTapGesture {
                    print(activityAuth.areActivitiesEnabled)
                    createActivity()
                }
            
            Spacer()
            
            Capsule()
                .frame(width: 5, height: 50)
            
            ZStack {
                ForEach(Marker.markers(), id: \.self) { marker in
                    // Compass View Marker
                    CompassMarkerView(marker: marker, compassDegrees: 0)
                    
                }
                
                Capsule()
                    .frame(width: 50, height: 50)
                    .onTapGesture {
                        endAllActivities()
                        print("All activities killed")
                    }
            }
            .frame(width: 300, height: 300)
            .rotationEffect(Angle(degrees: self.compassHeading.degrees))
            .statusBar(hidden: true)
            
            Text(String(format: "%.1f", abs(compassHeading.degrees)) + "°")
                .font(.system(size: 50))
                .padding(.top, 50)
                .onTapGesture {
                    for activity in activities {
                        updateActivity(activity: activity, angle: CGFloat(self.compassHeading.degrees), heading: "N")
                    }
                }
            
            Spacer()
        }
    }
    
    //Create the activity
    func createActivity() {
        print("Starting Activity...")
//        let center = UNUserNotificationCenter.current()
//        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//            if let error = error {
//                //Handle the error
//                print(error.localizedDescription)
//                print(error)
//
//            } else {
//                print(granted)
//            }
//
//            // Enable or disable features based on the authorization
//
//        }
        
        let attributes = HeadingAttributes(id: UUID())
        let contentState = HeadingAttributes.LiveHeadingData(angle: compassHeading.degrees, heading: "N")
        
        do {
            let activity = try Activity<HeadingAttributes>.request(attributes: attributes, contentState: contentState)
            print("Activity Started! \(activity.id)")
            activities.append(activity)
        } catch (let error) {
            print(error.localizedDescription)
            print(error)
            print("woops")
        }
        
        
    }
    
    //Update the activity
    func updateActivity(activity: Activity<HeadingAttributes>, angle: CGFloat, heading: String) {
        print("Updating activity \(activity.id)")
        let alertConfiguration = AlertConfiguration(title: "Delivery Update", body: "Your pizza order will arrive in 25 minutes.", sound: .default)
        Task {
            let updatedStatus = HeadingAttributes.LiveHeadingData(angle: angle, heading: heading)
            await activity.update(using: updatedStatus, alertConfiguration: alertConfiguration)
        }
    }
    
    //End the passed activity
    func endActivity(activity: Activity<HeadingAttributes>) {
        Task {
            await activity.end(dismissalPolicy: .immediate)
        }
    }
    
    func endAllActivities() {
        Task {
            for activity in Activity<HeadingAttributes>.activities {
                await activity.end(dismissalPolicy: .immediate)
            }
        }
    }
}

func hapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle = .rigid) {
    let generator = UIImpactFeedbackGenerator(style: style)
    generator.impactOccurred()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
