//
//  LockScreenWidget.swift
//  LockScreenWidget
//
//  Created by Suvass Ravala on 2/18/23.
//

import WidgetKit
import SwiftUI
import Intents
import Foundation
import CoreImage.CIFilterBuiltins

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}





struct LockScreenWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var url: String
    var body: some View {
        switch widgetFamily {
            case .accessoryRectangular:
                    Image(uiImage: generateQRCodeImage(url:url))
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 50, height: 50, alignment:.center)
                        .contrast(1000)
            default:
            Text("Not implemented")
        }
    }
    func generateQRCodeImage(url : String) -> UIImage {
        let data = Data(url.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let qrCodeImage = filter.outputImage {
            if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent) {
                return UIImage(cgImage: qrCodeCGImage)
            }
        }
        return UIImage(systemName: "xmark") ?? UIImage()
    }
}

struct LockScreenWidget: Widget {
    let kind: String = "LockScreenWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            LockScreenWidgetEntryView(url: "https://celebrated-pie-cbe7d3.netlify.app")
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.accessoryInline, .accessoryCircular, .accessoryRectangular,.systemLarge, .systemSmall])
    }
}

struct LockScreenWidget_Previews: PreviewProvider {
    static var previews: some View {
        LockScreenWidgetEntryView(url:"https://celebrated-pie-cbe7d3.netlify.app")
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
            .previewDisplayName("Inline")
    }
}
