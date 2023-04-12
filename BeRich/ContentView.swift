//
//  ContentView.swift
//  BeRich
//
//  Created by Максим Косников on 11.04.2023.
//

import SwiftUI
import Charts

struct ContentView: View {
    @Binding var selectedElement: Stock?
    
    var body: some View {
        
        VStack {
            Text("Candlestick - AAPL 2023")
                .font(.largeTitle)
                ZStack() {
                    ScrollViewReader { scrollPosition in
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            Chart {
                                
                                                RectangleMark(xStart: 500, xEnd: 600, yStart: 10, yEnd: 100) // Рисование квадратика для выделения паттерна
                                                .foregroundStyle(Color.red)
                                
                                ForEach(Stock.exampleData) { stock in
                                    RectangleMark( // Полосочка (миниум и максимум за день)
                                        x: .value("Date", stock.date, unit: .day),
                                        yStart: .value("Low", stock.lowPrice),
                                        yEnd: .value("High", stock.highPrice),
                                        width: 1
                                    )
                                    .foregroundStyle(Color.black)
                                    
                                    RectangleMark( // Прямоугольничек (где открылся и где закрылся)
                                        x: .value("Date", stock.date, unit: .day),
                                        yStart: .value("Open", stock.openPrice),
                                        yEnd: .value("Close", stock.closePrice),
                                        width: 5
                                    )
                                    .foregroundStyle(
                                        stock.openPrice <= stock.closePrice ? Color.green : Color.red
                                    )
                                }
                                
                            }
//                            .background(.red)
                            
                            
                            .chartYAxis {
                                AxisMarks(position: .leading, values: .automatic(desiredCount: 10))
                            }
//                            .chartYAxis(.hidden)
//////
                            .chartYScale(domain: 140...170) // Вертикальный масштаб
                            .chartXAxis {
                                AxisMarks(values: .automatic(desiredCount: 10))
                            }
//                            .chartXScale(
                            

                                                    .chartOverlay { proxy in
                                                        GeometryReader { nthGeometryItem in
                                                            Rectangle().fill(.clear).contentShape(Rectangle())
                                                                .gesture(
                                                                    SpatialTapGesture()
                                                                        .onEnded { value in
                                                                            let element = findElement(location: value.location, proxy: proxy, geometry: nthGeometryItem)
                                                                            if selectedElement?.date == element?.date {
                                                                                // If tapping the same element, clear the selection.
                                                                                selectedElement = nil
                                                                            } else {
                                                                                selectedElement = element
                                                                            }
                                                                        }
                                                                        .exclusively(
                                                                            before: DragGesture()
                                                                                .onChanged { value in
                                                                                    selectedElement = findElement(location: value.location, proxy: proxy, geometry: nthGeometryItem)
                                                                                }
                                                                        )
                                                                )
                                                        }
                                                    }
                            
//                            .padding()
                            
                            .frame(width: UIScreen.main.bounds.size.width + 1000, height: 400)
                            
                            //                .padding([.leading, .trailing], UIScreen.main.bounds.size.width / 2 - geometry.size.width / 2)
                            //                .frame(width: geometry.size.width + 2 * (UIScreen.main.bounds.size.width / 2 - geometry.size.width / 2), height: 400)
                            //                .fixedSize(horizontal: false, vertical: true)
                        }
                        
                    }
                    
                    .padding([.leading], -150)
//                    .padding(.trailing, -20)
                    HStack() {
                        
                        Chart {
                            RectangleMark( // Прямоугольничек (где открылся и где закрылся)
                                x: .value("Date", Stock.exampleData[0].date, unit: .day),
                                yStart: .value("Open", Stock.exampleData[0].openPrice),
                                yEnd: .value("Close", Stock.exampleData[0].closePrice),
                                width: 10
                            )
//                            BarMark(
//                                    x: .value("Shape Type", 1),
//                                    y: .value("Total Count", 1)
//                                )
    //                        EmptyView() // пустой график только для того, чтобы создать вертикальную ось
                        }
                        .chartYAxis {
                            AxisMarks(position: .trailing, values: .automatic(desiredCount: 10))
                        }
                        .chartYScale(domain: 140...170)
//                        .padding()
                        .padding(.trailing, 5)
                        .frame(width: 25, height: 400) // задаем фиксированную ширину контейнера с осью Y
                        .background(.white)
                        Spacer()
                        
                    }
                }
                
//            }
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveLollipop()
    }
}

struct InteractiveLollipop: View {
    @State private var selectedElement: Stock? = nil
    @Environment(\.layoutDirection) var layoutDirection

    var body: some View {
        ContentView(selectedElement: $selectedElement)
        .chartBackground { proxy in
            ZStack(alignment: .topLeading) {
                GeometryReader { nthGeoItem in
                    if let selectedElement = selectedElement {
                        let dateInterval = Calendar.current.dateInterval(of: .day, for: selectedElement.date)!
                        let startPositionX1 = proxy.position(forX: dateInterval.start) ?? 0
                        let startPositionX2 = proxy.position(forX: dateInterval.end) ?? 0
                        let midStartPositionX = (startPositionX1 + startPositionX2) / 2 + nthGeoItem[proxy.plotAreaFrame].origin.x

                        let lineX = layoutDirection == .rightToLeft ? nthGeoItem.size.width - midStartPositionX : midStartPositionX
                        let lineHeight = nthGeoItem[proxy.plotAreaFrame].maxY
                        let boxWidth: CGFloat = 150
                        let boxOffset = max(0, min(nthGeoItem.size.width - boxWidth, lineX - boxWidth / 2))

                        Rectangle()
                            .fill(.quaternary)
                            .frame(width: 2, height: lineHeight)
                            .position(x: lineX, y: lineHeight / 2)

                        VStack(alignment: .leading) {
                            Text("\(selectedElement.date, format: .dateTime.year().month().day())")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                            Text("""
                                 Open: \(selectedElement.openPrice, format: .number)
                                 Close: \(selectedElement.closePrice, format: .number)
                                 Low: \(selectedElement.lowPrice, format: .number)
                                 High: \(selectedElement.highPrice, format: .number)
                                 """)
                                .font(.callout.bold())
                                .foregroundColor(.primary)
                        }
                        .frame(width: boxWidth, alignment: .leading)
                        .background {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.background)
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.quaternary.opacity(0.7))
                            }
                            .padding([.leading, .trailing], -8)
                            .padding([.top, .bottom], -4)
                        }
                        .offset(x: boxOffset, y: 60)
                    }
                }
            }
        }
    }
}

func findElement(location: CGPoint, proxy: ChartProxy, geometry: GeometryProxy) -> Stock? {
    let data = Stock.exampleData
    let relativeXPosition = location.x - geometry[proxy.plotAreaFrame].origin.x
    if let date = proxy.value(atX: relativeXPosition) as Date? {
        // Find the closest date element.
        var minDistance: TimeInterval = .infinity
        var foundIndex: Int? = nil
        for index in data.indices {
            let nthDistance = data[index].date.distance(to: date)
            if abs(nthDistance) < minDistance {
                minDistance = abs(nthDistance)
                foundIndex = index
            }
        }
        if let foundIndex {
            return data[foundIndex]
        }
    }
    return nil
}
