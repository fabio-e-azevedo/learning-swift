import Foundation

func linearSearch<T: Equatable>(_ array: [T], _ object: T) -> Int? {
  for (index, obj) in array.enumerated() where obj == object {
    return index
  }
  return nil
}

let array = [5, 2, 4, 7]

let result = linearSearch(array, 9)

// Optional binding
if let value = result {
    print("The value is \(value)")
} else {
    print("The value is nil")
}

// Using nil-coalescing operator
print("The value is \(result ?? -1)")

// Using String(describing:)
print("The value is \(String(describing: result))")
