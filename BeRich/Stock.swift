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
        [
            
            
            Stock(name: "AAPL", date: "02/16/2023", openPrice: 0, closePrice: 0, highPrice: 0, lowPrice: 0),
            
            Stock(name: "AAPL", date: "03/06/2023", openPrice: 153.785, closePrice: 153.83, highPrice: 156.30, lowPrice: 153.46),
            Stock(name: "AAPL", date: "03/07/2023", openPrice: 153.70, closePrice: 151.60, highPrice: 154.0299, lowPrice: 151.13),
            Stock(name: "AAPL", date: "03/08/2023", openPrice: 152.81, closePrice: 152.87, highPrice: 153.47, lowPrice: 151.83),
            Stock(name: "AAPL", date: "03/09/2023", openPrice: 153.559, closePrice: 150.59, highPrice: 154.535, lowPrice: 150.225),
            Stock(name: "AAPL", date: "03/10/2023", openPrice: 150.21, closePrice: 148.50, highPrice: 150.94, lowPrice: 147.6096),
            Stock(name: "AAPL", date: "03/13/2023", openPrice: 147.805, closePrice: 150.47, highPrice: 153.14, lowPrice: 147.70),
            Stock(name: "AAPL", date: "03/14/2023", openPrice: 151.28, closePrice: 152.59, highPrice: 153.40, lowPrice: 150.10),
            Stock(name: "AAPL", date: "03/15/2023", openPrice: 151.19, closePrice: 152.99, highPrice: 153.245, lowPrice: 149.92),
            Stock(name: "AAPL", date: "03/16/2023", openPrice: 152.16, closePrice: 155.85, highPrice: 156.46, lowPrice: 151.64),
            Stock(name: "AAPL", date: "03/17/2023", openPrice: 156.08, closePrice: 155.00, highPrice: 156.74, lowPrice: 154.28),
            Stock(name: "AAPL", date: "03/20/2023", openPrice: 155.07, closePrice: 157.40, highPrice: 157.82, lowPrice: 154.15),
            Stock(name: "AAPL", date: "03/21/2023", openPrice: 157.32, closePrice: 159.28, highPrice: 159.40, lowPrice: 156.54),
            Stock(name: "AAPL", date: "03/22/2023", openPrice: 159.30, closePrice: 157.83, highPrice: 162.14, lowPrice: 157.81),
            Stock(name: "AAPL", date: "03/23/2023", openPrice: 158.83, closePrice: 158.93, highPrice: 161.5501, lowPrice: 157.68),
            Stock(name: "AAPL", date: "03/24/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
            Stock(name: "AAPL", date: "03/27/2023", openPrice: 159.94, closePrice: 158.28, highPrice: 160.77, lowPrice: 157.87),
            Stock(name: "AAPL", date: "03/28/2023", openPrice: 157.97, closePrice: 157.65, highPrice: 158.49, lowPrice: 155.98),
            Stock(name: "AAPL", date: "03/29/2023", openPrice: 159.37, closePrice: 160.77, highPrice: 161.05, lowPrice: 159.35),
            Stock(name: "AAPL", date: "03/30/2023", openPrice: 161.53, closePrice: 162.36, highPrice: 162.47, lowPrice: 161.271),
            Stock(name: "AAPL", date: "03/31/2023", openPrice: 162.44, closePrice: 164.90, highPrice: 165.00, lowPrice: 161.91),
            Stock(name: "AAPL", date: "04/03/2023", openPrice: 164.27, closePrice: 166.17, highPrice: 166.29, lowPrice: 164.22),
            
            Stock(name: "AAPL", date: "04/06/2023", openPrice: 153.785, closePrice: 153.83, highPrice: 156.30, lowPrice: 153.46),
            Stock(name: "AAPL", date: "04/07/2023", openPrice: 153.70, closePrice: 151.60, highPrice: 154.0299, lowPrice: 151.13),
            Stock(name: "AAPL", date: "04/08/2023", openPrice: 152.81, closePrice: 152.87, highPrice: 153.47, lowPrice: 151.83),
            Stock(name: "AAPL", date: "04/09/2023", openPrice: 153.559, closePrice: 150.59, highPrice: 154.535, lowPrice: 150.225),
            Stock(name: "AAPL", date: "04/10/2023", openPrice: 150.21, closePrice: 148.50, highPrice: 150.94, lowPrice: 147.6096),
            Stock(name: "AAPL", date: "04/13/2023", openPrice: 147.805, closePrice: 150.47, highPrice: 153.14, lowPrice: 147.70),
            Stock(name: "AAPL", date: "04/14/2023", openPrice: 151.28, closePrice: 152.59, highPrice: 153.40, lowPrice: 150.10),
            Stock(name: "AAPL", date: "04/15/2023", openPrice: 151.19, closePrice: 152.99, highPrice: 153.245, lowPrice: 149.92),
            Stock(name: "AAPL", date: "04/16/2023", openPrice: 152.16, closePrice: 155.85, highPrice: 156.46, lowPrice: 151.64),
            Stock(name: "AAPL", date: "04/17/2023", openPrice: 156.08, closePrice: 155.00, highPrice: 156.74, lowPrice: 154.28),
            Stock(name: "AAPL", date: "04/20/2023", openPrice: 155.07, closePrice: 157.40, highPrice: 157.82, lowPrice: 154.15),
            Stock(name: "AAPL", date: "04/21/2023", openPrice: 157.32, closePrice: 159.28, highPrice: 159.40, lowPrice: 156.54),
            Stock(name: "AAPL", date: "04/22/2023", openPrice: 159.30, closePrice: 157.83, highPrice: 162.14, lowPrice: 157.81),
            Stock(name: "AAPL", date: "04/23/2023", openPrice: 158.83, closePrice: 158.93, highPrice: 161.5501, lowPrice: 157.68),
            Stock(name: "AAPL", date: "04/24/2023", openPrice: 158.86, closePrice: 160.25, highPrice: 160.34, lowPrice: 157.85),
            Stock(name: "AAPL", date: "04/27/2023", openPrice: 159.94, closePrice: 158.28, highPrice: 160.77, lowPrice: 157.87),
            Stock(name: "AAPL", date: "04/28/2023", openPrice: 157.97, closePrice: 157.65, highPrice: 158.49, lowPrice: 155.98),
            Stock(name: "AAPL", date: "04/29/2023", openPrice: 159.37, closePrice: 160.77, highPrice: 161.05, lowPrice: 159.35),
            Stock(name: "AAPL", date: "04/30/2023", openPrice: 161.53, closePrice: 162.36, highPrice: 162.47, lowPrice: 161.271),
//            Stock(name: "AAPL", date: "04/31/2023", openPrice: 162.44, closePrice: 164.90, highPrice: 165.00, lowPrice: 161.91),
            Stock(name: "AAPL", date: "05/03/2023", openPrice: 164.27, closePrice: 166.17, highPrice: 166.29, lowPrice: 164.22),
        ]
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yyyy"
    return formatter
}()
