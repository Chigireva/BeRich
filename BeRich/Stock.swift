import Foundation

public struct Stock: Identifiable {
    public var id = UUID()
    public var name: String
    public var date: Date
    public var openPrice: Double
    public var closePrice: Double
    public var highPrice: Double
    public var lowPrice: Double
    
    public init(
        name: String,
        date: String,
        openPrice: Double,
        closePrice: Double,
        highPrice: Double,
        lowPrice: Double
    ) {
        self.name = name
        print("parsed date from '\(date)': \(dateFormatter.date(from: date))")
        self.date = dateFormatter.date(from: date)!
        self.openPrice = openPrice
        self.closePrice = closePrice
        self.highPrice = highPrice
        self.lowPrice = lowPrice
    }
}

extension Stock {
    public static var exampleData: [Stock] {
        let dayes: [Int] = [31,28,31,30,31,30,31,31,30,31,30,31]
        let mounth: [String] = ["01","02","03","04","05","06","07","08","09","10","11","12"]
        var stocks = [Stock]()
        for i in 2023...2024 {
            for j in 0..<12{
                if i % 4 == 0 && j == 1 {
                    for ij in 1..<dayes[j] + 1 {
                        var date:String
                        if ij <= 9 {
                            date = mounth[j] + "/0" + String(ij) + "/" + String(i)
                        } else {
                            date = mounth[j] + "/" + String(ij) + "/" + String(i)
                        }
                        let op = Double.random(in: 150.0..<160.0)
                        let cp = Double.random(in: 150.0..<160.0)
                        let minp = Double.random(in: 145.0..<min(op,cp))
                        let maxp = Double.random(in: max(op,cp)..<165)
                        
                        stocks.append(Stock(name: "AAPL", date: date, openPrice: op, closePrice: cp, highPrice: maxp, lowPrice: minp))
                    }
                    
                } else {
                    for ij in 1..<dayes[j] {
                        var date:String
                        if ij <= 9 {
                            date = mounth[j] + "/0" + String(ij) + "/" + String(i)
                        } else {
                            date = mounth[j] + "/" + String(ij) + "/" + String(i)
                        }
                        let op = Double.random(in: 140.0..<160.0)
                        let cp = Double.random(in: 140.0..<160.0)
                        let minp = Double.random(in: 130.0..<min(op,cp))
                        let maxp = Double.random(in: max(op,cp)..<170)
                        stocks.append(Stock(name: "AAPL", date: date, openPrice: op, closePrice: cp, highPrice: maxp, lowPrice: minp))
                    }
                }
            }
            
        }
        return stocks
    }

}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yyyy"
    return formatter
}()
