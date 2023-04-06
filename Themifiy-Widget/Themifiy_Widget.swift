//
//  Themifiy_Widget.swift
//  Themifiy-Widget
//
//  Created by Brilliant Gamez on 4/9/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    @AppStorage("rememberItem", store: UserDefaults(suiteName: "group.com.kaizen.theme.wallpapers.icon.widgets")) var primaryItemData: Data = Data()
    
    func placeholder(in context: Context) -> ThemifyEntry {
        let rememberItem = WidgetModel(id: 101, name: "widget1", type: "clock",paid: false)
        return ThemifyEntry(date: Date(),rememberItem: rememberItem)
    }

    func getSnapshot(in context: Context, completion: @escaping (ThemifyEntry) -> ()) {
        guard let rememberItem = try? JSONDecoder().decode(WidgetModel.self, from: primaryItemData) else {
            print("Unable to decode primary item")
            return
        }
        let entry = ThemifyEntry(date: Date(),rememberItem: rememberItem)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        guard let rememberItem = try? JSONDecoder().decode(WidgetModel.self, from: primaryItemData) else {
            print("Unable to decode primary item")
            return
        }
        let entry = ThemifyEntry(date: Date(),rememberItem: rememberItem)

        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

struct ThemifyEntry: TimelineEntry {
    let date: Date
    let rememberItem: WidgetModel
}

struct Themifiy_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        if family == .systemSmall{
            SmallWidget(widget: entry.rememberItem, date: entry.date, isPreview: false, imgUrl: "")
        }else if family == .systemMedium {
            MediumWidget(widget: entry.rememberItem, date: entry.date, isPreview: false, imgUrl: "")
        }else {
            LargeWidget(widget: entry.rememberItem, date: entry.date, isPreview: false, imgUrl: "")
        }
        
    }
}

@main
struct Themifiy_Widget: Widget {
    let kind: String = "Themifiy_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Themifiy_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall,.systemMedium, .systemLarge])
    }
}


struct Themifiy_Widget_Previews: PreviewProvider {
    static let rememberItem = WidgetModel(id: 101, name: "widget1", type: "clock",paid: false)
    static var previews: some View {
        Group{
            Themifiy_WidgetEntryView(entry: ThemifyEntry(date: Date(),rememberItem: rememberItem))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            Themifiy_WidgetEntryView(entry: ThemifyEntry(date: Date(),rememberItem: rememberItem))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            Themifiy_WidgetEntryView(entry: ThemifyEntry(date: Date(),rememberItem: rememberItem))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
