//
//  ActiveUsersWidget.swift
//  ActiveUsersWidget
//
//  Created by Максим Шишлов on 21.06.2024.
//

import WidgetKit
import SwiftUI

struct ActiveUsersWidget: Widget {
    let kind: String = "ActiveUsersWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ActiveUsersWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Active Users")
        .description("Shows a list of active users.")
        .supportedFamilies([.systemMedium])
    }
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), contacts: [])
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), contacts: loadActiveUsers())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, contacts: loadActiveUsers())
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let contacts: [Contact]
}

func loadActiveUsers() -> [Contact] {
    let viewModel = ContactsViewModel()
    return viewModel.contacts.filter { $0.isOnline }
}

struct ActiveUsersWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(entry.contacts.prefix(3)) { user in
                HStack {
                    if let imageName = user.imageName {
                        Image(imageName)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.lastSeen)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    
                    Button(action: {
                        // Добавить переход на детальку контакта
                    }) {
                        Image(systemName: "person.fill")
                            .foregroundColor(.green)
                    }
                }
                .padding(.bottom, 4)
            }
        }
        .padding()
    }
}

#Preview(as: .systemMedium) {
    ActiveUsersWidget()
} timeline: {
    SimpleEntry(date: .now, contacts: ContactsViewModel().contacts)
}
