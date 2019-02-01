import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

extension URL
{
    func withQueries(_ queries: [String: String]) -> URL?
    {
        var component = URLComponents(url: self, resolvingAgainstBaseURL: true)
        component?.queryItems = queries.compactMap{ URLQueryItem(name: $0.0, value: $0.1)}
        return component?.url
    }
}

let baseUrl = URL(string: "https://api.nasa.gov/planetary/apod")!

let query: [String: String] =
[
    "api_key": "DEMO_KEY",
    "date": "2003-10-07"
]
let url = baseUrl.withQueries(query)!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data
    {
        let string = String(data: data, encoding: .utf8)
        print(string)
        
    }
}

task.resume()

