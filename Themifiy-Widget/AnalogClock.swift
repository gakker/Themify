//
//  AnalogClock.swift
//  Themify
//
//  Created by Brilliant Gamez on 4/11/22.
//

import SwiftUI
import Combine

struct ClockTickerModel {
    enum TickerType {
        case second
        case hour
        case minute
    }
    let type: TickerType
    let timeInterval: TimeInterval
    let tickScale: CGFloat
    
    var angleMultiplier: CGFloat {
        switch type {
        case .second:
            return CGFloat(self.timeInterval.remainder(dividingBy: 60)) / 60
        case .hour:
            return CGFloat(timeInterval / 3600) / 12
        case .minute:
            return CGFloat((timeInterval - Double(Int(timeInterval / 3600) * 3600)) / 60) / 60
        }
    }
    
    var tickerScale: CGFloat {
        switch type {
        case .second:
            return 0.8
        case .hour:
            return 0.4
        case .minute:
            return 0.6
        }
    }
}

struct Clock: Shape {
    var model: ClockTickerModel
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let length = rect.width / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)

        path.move(to: center)
        let hoursAngle = CGFloat.pi / 2 - .pi * 2 * model.angleMultiplier
        path.addLine(to: CGPoint(x: rect.midX + cos(hoursAngle) * length * model.tickerScale,
                                 y: rect.midY - sin(hoursAngle) * length * model.tickerScale))
        return path
    }
}

final class CurrentTime: ObservableObject {
    @Published var seconds: TimeInterval = CurrentTime.currentSecond(date: Date())

    private let timer = Timer.publish(every: 0.2, on: .main, in: .default).autoconnect()
    private var store = Set<AnyCancellable>()

    init() {
        timer.map(Self.currentSecond).assign(to: \.seconds, on: self).store(in: &store)
    }

    private static func currentSecond(date: Date) -> TimeInterval {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        let referenceDate = Calendar.current.date(from: DateComponents(year: components.year!, month: components.month!, day: components.day!))!
        return Date().timeIntervalSince(referenceDate)
    }
}

struct AnalogClock: View {
    @ObservedObject var time = CurrentTime()
    
    var size: Int
    var color: Color
        
        func tick(at tick: Int) -> some View {
                   VStack {
                       
                       

                       Rectangle()
                           .fill(color)
                           .opacity(tick % 15 == 0 ? 0 : 0.05)
                           .frame(width: 2, height: tick % 15 == 0 ? 15 : 7)
                       Spacer()
               }.rotationEffect(Angle.degrees(Double(tick)/(12) * 360))
        }
        
        var body: some View {
            return ZStack {
                ForEach(0..<60) { tick in
                    self.tick(at: tick)
                }
                GeometryReader { geometry in
                    ZStack {
                        HStack {
                            Text("9").foregroundColor(color)
                            Spacer()
                            Text("3").foregroundColor(color)
                            EmptyView()
                        }
                        VStack {
                            EmptyView()
                            Text("12").foregroundColor(color)
                            Spacer()
                            Text("6").foregroundColor(color)
                            EmptyView()
                        }
                    }.frame(width: geometry.size.width , height: geometry.size.height, alignment: .center)
                }
                
                Clock(model: .init(type: .hour, timeInterval: time.seconds, tickScale: 0.4))
                .stroke(color, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle.degrees(360/60))
                
                Clock(model: .init(type: .minute, timeInterval: time.seconds, tickScale: 0.6))
                .stroke(color, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle.degrees(360/60))
                
//                Clock(model: .init(type: .second, timeInterval: time.seconds, tickScale: 0.8))
//                .stroke(Color.red, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
//                    .rotationEffect(Angle.degrees(360/60))
                
                }.frame(width: 100, height: 100, alignment: .center)
        }
}

struct AnalogClock_Previews: PreviewProvider {
    
    static var size = 100
    static var color = Color.black
    
    static var previews: some View {
        AnalogClock(size: size, color: color)
    }
}
