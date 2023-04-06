//
//  AnalogWidgetMedium.swift
//  Themify
//
//  Created by Brilliant Gamez on 4/11/22.
//

import SwiftUI

struct AnalogWidgetMedium: View {
    
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
            HStack{
                Spacer()
                AnalogClock(size: 100, color: Color.white)
                Spacer()
                VStack(alignment: .leading){
                    Text(AppUtils.getDay(date: date)).font(.system(size: 30)).foregroundColor(Color.white)
                    Text(AppUtils.getFormattedDate(date: date)).foregroundColor(Color.white)
                }
                Spacer()
            }
        }
    }
}

struct AnalogWidgetMedium_Previews: PreviewProvider {
    static let widget = WidgetModel(id: 101, name: "widget2", type: "clock",paid: false)
    static let date = Date()
    static var previews: some View {
        AnalogWidgetMedium(widget: widget, date: date, isPreview: true, imgUrl: "").frame(width: 300, height:150)
    }
}
