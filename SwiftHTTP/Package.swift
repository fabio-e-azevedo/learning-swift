// swift-tools-version: 5.4
import PackageDescription

let package = Package(
   name: "SwiftHTTP",
   products: [
    .executable(name: "SwiftHTTP", targets: ["SwiftHTTP"]),
   ],
   dependencies: [
    .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.2"),
    .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.9.1")
   ],
   targets: [
    .executableTarget(
      name: "SwiftHTTP",
      dependencies: ["SwiftyJSON", "Alamofire"]
    )
   ]
)
