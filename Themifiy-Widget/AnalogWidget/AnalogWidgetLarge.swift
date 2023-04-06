//
//  AnalogWidgetLarge.swift
//  Themify
//
//  Created by Brilliant Gamez on 4/11/22.
//

import SwiftUI

struct AnalogWidgetLarge: View {
    
    var widget: WidgetModel
    var date: Date
    var isPreview: Bool
    var imgUrl: String
    
    var body: some View {
        ZStack{
            Color.black
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
            VStack{
                AnalogClock(size: 100, color: Color.white)
                Text(AppUtils.getDay(date: date)).font(.system(size: 30)).foregroundColor(Color.white)
                Text(AppUtils.getFormattedDate(date: date)).foregroundColor(Color.white)
            }
            
        }
    }
}

struct AnalogWidgetLarge_Previews: PreviewProvider {
    static let widget = WidgetModel(id: 101, name: "widget1", type: "clock" ,paid: false)
    static let date = Date()
    static var previews: some View {
        AnalogWidgetLarge(widget: widget, date: date, isPreview: true, imgUrl: "").frame(width: 300, height: 300)
    }
}
