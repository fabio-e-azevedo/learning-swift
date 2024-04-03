import Foundation
import Alamofire
import SwiftyJSON


Alamofire.request("https://jsonplaceholder.typicode.com/users").responseJSON { response in
    if let result = response.result.value {
        let json = JSON(result)
        print(json["url"])
        print(json["explanation"])
    }
}

RunLoop.main.run()
