//
//  DigitalWidgetMedium.swift
//  Themify
//
//  Created by Brilliant Gamez on 4/11/22.
//

import SwiftUI

struct DigitalWidgetMedium: View {
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
            VStack{
                HStack{
                    Image(systemName: "cloud.fill").foregroundColor(Color.black)
                    Text("Cloudy").font(.system(size: 12)).foregroundColor(Color.black)
                    Text("39,2").font(.system(size: 14)).foregroundColor(Color.black)
                }
                Spacer().frame(height:10)
                Text(date, style: .time).foregroundColor(Color.black).font(.system(size: 30))
                Spacer().frame(height:10)
                Text(AppUtils.getFormattedDate(date: date)).font(.system(size: 12)).foregroundColor(Color.black)
            }
        }
    }
}

struct DigitalWidgetMedium_Previews: PreviewProvider {
    
    static let widget = WidgetModel(id: 101, name: "widget1",type: "digital",paid: false)
    static let date = Date()
    
    static var previews: some View {
        DigitalWidgetMedium(widget: widget, date: date, isPreview: true, imgUrl: "").frame(width: 300, height: 150)
    }
}
