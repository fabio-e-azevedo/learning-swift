import Foundation

#if os(Linux)
import FoundationNetworking
#endif

struct SomeApp {
    static func main() {
        print("Fetching data...")

        let sema = DispatchSemaphore(value: 0)
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                fatalError(error!.localizedDescription)
            }

            print("Fetched data: \(data)")
            sema.signal()
        }

        task.resume()
        sema.wait()
    }
}

SomeApp.main()
