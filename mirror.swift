struct ExampleStruct: CustomStringConvertible {
    // Propriedade calculada
    var description: String {
        return "ExampleStruct(name: \(name), value: \(value))"
    }
    
    // Propriedades armazenadas
    var name: String
    var value: Int
}

let example = ExampleStruct(name: "Dead Duck", value: 42)
let mirror = Mirror(reflecting: example)

print("Type: \(mirror.subjectType)")

// children contém apenas as propriedades armazenadas
for child in mirror.children {
    if let label = child.label {
        print("Property: \(label), Value: \(child.value)")
    } else {
        print("Property: unknown, Value: \(child.value)")
    }
}

print("Computed property: \(example.description)")
