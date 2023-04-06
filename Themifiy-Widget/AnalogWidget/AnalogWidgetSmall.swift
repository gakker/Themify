//
//  AnalogWidgetSmall.swift
//  Themify
//
//  Created by Brilliant Gamez on 4/11/22.
//

import SwiftUI

struct AnalogWidgetSmall: View {
    
    var widget: WidgetModel
    var date: Date
    var isPreview: Bool
    var imgUrl: String
    
    var body: some View {
        ZStack{
            if isPreview{
                MyAsyncImage(url: URL(string: imgUrl)!,
                             placeholder: { ZStack{
                    Color.gray.opacity(0.3)
                    ProgressView()
                } },
                               image: { Image(uiImage: $0).resizable() })
            } else {
                Image(uiImage: UIImage(data: widget.data!)!).resizable()
            }
            AnalogClock(size: 100, color: Color.white)
        }
    }
}

struct AnalogWidgetSmall_Previews: PreviewProvider {
    
    static let widget = WidgetModel(id: 101, name: "widget1",type: "clock",paid: false)
    static let date = Date()
    static var previews: some View {
        AnalogWidgetSmall(widget: widget, date: date, isPreview: true, imgUrl: "").frame(width: 150, height: 150)
    }
}
