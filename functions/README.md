### 1. Funções Aninhadas

Swift permite que você defina funções dentro de outras funções. Estas são chamadas de funções aninhadas.

```swift
func outerFunction() {
    func innerFunction() {
        print("Esta é uma função aninhada")
    }
    innerFunction()
}

outerFunction()  // Output: Esta é uma função aninhada
```

### 2. Funções como Tipos de Primeira Classe

Em Swift, funções são tipos de primeira classe, o que significa que você pode:
- Atribuir funções a variáveis
- Passar funções como argumentos para outras funções
- Retornar funções de outras funções

#### Atribuir a Variáveis

```swift
func add(a: Int, b: Int) -> Int {
    return a + b
}

let addition: (Int, Int) -> Int = add
print(addition(3, 5))  // Output: 8
```

#### Passar como Argumento

```swift
func performOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

let result = performOperation(4, 2, operation: add)
print(result)  // Output: 6
```

#### Retornar Funções

```swift
func makeIncrementer(incrementAmount: Int) -> (Int) -> Int {
    func incrementer(number: Int) -> Int {
        return number + incrementAmount
    }
    return incrementer
}

let incrementByFive = makeIncrementer(incrementAmount: 5)
print(incrementByFive(10))  // Output: 15
```

### 3. Funções com Valor de Retorno Opcional

Funções podem retornar valores opcionais, indicando que a função pode ou não retornar um valor.

```swift
func findFirstPositive(numbers: [Int]) -> Int? {
    for number in numbers {
        if number > 0 {
            return number
        }
    }
    return nil
}

let numbers = [-1, -2, 0, 3, 4]
if let firstPositive = findFirstPositive(numbers: numbers) {
    print("Primeiro número positivo: \(firstPositive)")  // Output: Primeiro número positivo: 3
} else {
    print("Nenhum número positivo encontrado")
}
```

### 4. Funções Variádicas

Funções variádicas aceitam um número variável de argumentos do mesmo tipo.

```swift
func sum(numbers: Int...) -> Int {
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}

print(sum(numbers: 1, 2, 3, 4, 5))  // Output: 15
```

### 5. Parâmetros com Valores Padrão

Você pode definir valores padrão para parâmetros de funções. Se o argumento não for fornecido, o valor padrão será usado.

```swift
func greet(name: String, message: String = "Olá") {
    print("\(message), \(name)!")
}

greet(name: "João")             // Output: Olá, João!
greet(name: "Maria", message: "Bom dia")  // Output: Bom dia, Maria!
```

### 6. Inout Parameters

Swift permite que você passe variáveis como "inout" para modificar seus valores dentro da função.

```swift
func swapValues(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var x = 3
var y = 5
swapValues(&x, &y)
print("x: \(x), y: \(y)")  // Output: x: 5, y: 3
```

### 7. Funções Genéricas

Você pode criar funções genéricas que funcionam com qualquer tipo.

```swift
func swapGeneric<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var first = "Hello"
var second = "World"
swapGeneric(&first, &second)
print("first: \(first), second: \(second)")  // Output: first: World, second: Hello

var number1 = 10
var number2 = 20
swapGeneric(&number1, &number2)
print("number1: \(number1), number2: \(number2)")  // Output: number1: 20, number2: 10
```

Esses são alguns dos conceitos avançados e úteis sobre funções em Swift que podem ajudar você a escrever código mais flexível e eficiente.