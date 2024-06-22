//
//  ActiveUsersWidgetLiveActivity.swift
//  ActiveUsersWidget
//
//  Created by Максим Шишлов on 21.06.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ActiveUsersWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ActiveUsersWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ActiveUsersWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension ActiveUsersWidgetAttributes {
    fileprivate static var preview: ActiveUsersWidgetAttributes {
        ActiveUsersWidgetAttributes(name: "World")
    }
}

extension ActiveUsersWidgetAttributes.ContentState {
    fileprivate static var smiley: ActiveUsersWidgetAttributes.ContentState {
        ActiveUsersWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ActiveUsersWidgetAttributes.ContentState {
         ActiveUsersWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ActiveUsersWidgetAttributes.preview) {
   ActiveUsersWidgetLiveActivity()
} contentStates: {
    ActiveUsersWidgetAttributes.ContentState.smiley
    ActiveUsersWidgetAttributes.ContentState.starEyes
}
