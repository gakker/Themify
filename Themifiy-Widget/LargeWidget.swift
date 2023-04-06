//
//  LargeWidget.swift
//  Themify
//
//  Created by Brilliant Gamez on 4/11/22.
//

import SwiftUI
import WidgetKit

struct LargeWidget: View {
    var widget: WidgetModel
    var date: Date
    var isPreview: Bool
    var imgUrl: String

    var body: some View {
        if widget.type == "clock" {
            AnalogWidgetLarge(widget: widget, date: date, isPreview: isPreview, imgUrl: imgUrl)
        }else if widget.type == "digital"{
            DigitalMediumLarge(widget: widget, date: date, isPreview: isPreview, imgUrl: imgUrl)
        }
        else{
            ZStack{
                MyAsyncImage(url: URL(string: imgUrl)!,
                             placeholder: { ZStack{
                    Color.gray.opacity(0.3)
                    ProgressView()
                } },
                               image: { Image(uiImage: $0).resizable() })
                VStack{
                    Text("Large Widget").foregroundColor(Color.white)
                    Text(date, style: .time).foregroundColor(Color.white)
                }
            }
        }
        
    }
}

struct LargeWidget_Previews: PreviewProvider {
    static let widget = WidgetModel(id: 101, name: "widget1", type: "clock",paid: false)
    static let date = Date()
    static var previews: some View {
        LargeWidget(widget: widget, date: date, isPreview: true,imgUrl: "").frame(width: 300, height: 300)
    }
}
