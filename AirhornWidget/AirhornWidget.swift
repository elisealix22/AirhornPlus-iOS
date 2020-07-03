//
//  AirhornWidget.swift
//  AirhornWidget
//
//  Created by Elise Alix on 7/3/20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    public typealias Entry = SimpleEntry

    public func snapshot(with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let timeline = Timeline(entries: [SimpleEntry(date: Date())], policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
}

struct PlaceholderView : View {
    var body: some View {
        Text("Getting hype!")
    }
}

struct AirhornWidgetEntryView : View {
    var entry: Provider.Entry

    let backgroundColor = Color(red: 0 / 255, green: 5 / 255, blue: 77 / 255)
    let backgroundColor2 = Color(red: 92 / 255, green: 139 / 255, blue: 169 / 255)
    let shadowColor = Color(red: 3 / 255, green: 3 / 255, blue: 26 / 255)
    let buttonColor = Color(red: 232 / 255, green: 82 / 255, blue: 39 / 255)

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [backgroundColor, backgroundColor2]),
                           startPoint: .top, endPoint: .bottom)

            GeometryReader { geometry in
                let buttonSize: CGFloat = geometry.size.height * 5/6
                ZStack {
                    Circle()
                        .frame(width: buttonSize, height: buttonSize, alignment: .center)
                        .foregroundColor(buttonColor)
                        .shadow(color: shadowColor.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: shadowColor.opacity(0.7), radius: 10, x: -5, y: -5)

                    Text("Insert\nAirhorn")
                        .fontWeight(.semibold)
                        .kerning(0.8)
                        .font(.system(size: buttonSize / 8))
                        .opacity(0.6)
                        .padding()
                        .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(10)
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

@main
struct AirhornWidget: Widget {
    private let kind: String = "AirhornWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView()) { entry in
            AirhornWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Insert Airhorn")
        .description("WA WA WAAAAAAAAAAAAAAAAAA!")
    }
}

struct AirhornWidget_Previews: PreviewProvider {
    static var previews: some View {
        AirhornWidgetEntryView(entry: SimpleEntry(date: Date()))
    }
}
