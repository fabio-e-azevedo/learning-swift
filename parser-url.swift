import Foundation

let urlString: String = "https://example.com:8080/path/to/resource?firstname1=Dead&lastname1=Duck#section1"

if let urlComponents = URLComponents(string: urlString) {
    print("Scheme: \(urlComponents.scheme ?? "none")")
    print("Host: \(urlComponents.host ?? "none")")
    print("Port: \(urlComponents.port ?? 0)")
    print("Path: \(urlComponents.path)")
    print("Query: \(urlComponents.query ?? "none")")
    print("Fragment: \(urlComponents.fragment ?? "none")")
    
    if let queryItems = urlComponents.queryItems {
        for queryItem in queryItems {
            print("Query item name: \(queryItem.name), value: \(queryItem.value ?? "none")")
        }
    }
}

var newURLString: String?

if var urlComponents = URLComponents(string: urlString) {
    // Modificar o Path
    urlComponents.path = "/new/path/to/resource"

    // Modificar ou adicionar parâmetros de consulta
    var queryItems = urlComponents.queryItems ?? []
    queryItems.append(URLQueryItem(name: "firstname2", value: "Bob"))
    queryItems.append(URLQueryItem(name: "lastname2", value: "Cuspe"))
    urlComponents.queryItems = queryItems

    // Modificar o fragmento
    urlComponents.fragment = "section2"

    if let newURL = urlComponents.url {
        newURLString = newURL.absoluteString
        print("\nNew URL 1: \(newURLString ?? "none")")
    }
}

if let url = newURLString {
    if var urlComponents = URLComponents(string: url) {
        if let queryItems = urlComponents.queryItems {
            for queryItem in queryItems {
                print("Query item name: \(queryItem.name), value: \(queryItem.value ?? "none")")
            }
            urlComponents.queryItems = queryItems.map { queryItem in
                if queryItem.name == "lastname1" {
                    return URLQueryItem(name: queryItem.name, value: "fish")
                } else {
                    return queryItem
                }
            }
        }

        if let newURL = urlComponents.url {
            print("\nNew URL 2: \(newURL.absoluteString)")
            if let queryItems = urlComponents.queryItems {
                for queryItem in queryItems {
                    print("Query item name: \(queryItem.name), value: \(queryItem.value ?? "none")")
                }
            }
        }
    }
}