//
//  ViewController.swift
//  AlgorithmPractice
//
//  Created by Kumaran on 14/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    var intArray = [1,5,9,3,7,4,6,8,2,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sortArray = selectionSortAlgo(incomingArray: intArray)
//        print(sortArray)
        mapPractice()
        compactPractice()
        flatMapPractice()
        filterPractice()
        reducePractice()
        dnreddy()
    }
    
    func selectionSortAlgo(incomingArray: [Int]) -> [Int] {
        
        // Creating a copy of original array
        var tempArray = incomingArray
        
        // Selecting minimum element and
        // then place it at the beginning of the array
        for x in 0..<tempArray.count {
            var tempIndex = x
            for y in x+1..<tempArray.count {
                if tempArray[y] < tempArray[tempIndex] {
                    tempIndex = y
                }
            }
            if tempIndex != x {
                tempArray.swapAt(x, tempIndex)
            }
        }
        return tempArray
    }
    
    func mapPractice() {
        // MARK: - Higher Order Function - Map
//        var numbers: [Int] = [1, 2, 3, 4, 5]
//
//        var tempArray: [Int] = []
//
//        for number in numbers {
//            tempArray.append(number * 5)
//        }
//        print(tempArray)
//
//        let m1 = numbers.map { number in
//            return number * 5
//        }
//        print("M1", m1)
//
//        let m2 = numbers.map({ $0 * 5 })
//        print("M2", m2)
//
//        let m3 = numbers.map{ $0 * 5 }
//        print("M3", m3)
        
        
        //MARK:- Higher Order Function is a function that takes one or more functions as arguments or returns a function as its result

        //MARK:- Map a higerOrder function that can perfom single operation on colletion.

        let numbers = [1,4,6,8,2,3,5,9,0,7]

        /// now multiply numbers array with 5

        /// k owing index with map

        let indexOfArrat = numbers.enumerated().map { (index, value) in
            return "Index: \(index) has value \(value)"
        }
        print(indexOfArrat)

        var m1: [Int] = []
        for number in numbers {
            m1.append(number * 5)
        }
        print("M1" , m1)

        let m2: [Int] = numbers.map { num in
            return num * 5
        }

        print("M2", m2)

        let m3: [Int] = numbers.map({$0 * 5})
        print("M3", m3)

        let m4: [Int] = numbers.map{ $0 * 5 }
        print("M4", m4)

        let m5:[Int] = numbers.map({(someInt: Int) -> Int in
                                    return someInt * 5})
        print("M5", m5)

        //MARK:- Map on dictionary

        var bookDict = ["HarryPotter": 300.00, "JungleeBook": 400.00]

        let returnFromDict = bookDict.map { (key, value) in
            return "Key: \(key) , Value: \(value)"
        }

        print(returnFromDict)

        //MARK:- Map on Set

        var bookSet: Set = [300.00, 400.00, 500.00]

        let returnFromSet = bookSet.map { value in
            return value * 2
        }
        print(returnFromSet)

        let returnFromSet1 = bookSet.map { $0 * 300 }
        print(returnFromSet1)
    }
    
    func compactPractice() {
        //MARK: - Compact Map - Similar to Map hai but wo optional and nil value ko remove karta hai

//        let numbers: [Int?] = [1, nil, 2, 3, nil, 4]
//
//        let m1 = numbers.map { number -> Int? in
//            if let number {
//                return number * 2
//            }else {
//                return nil
//            }
//        }
//        print(m1)
//
//        let m2 = numbers.map{ $0 == nil ? nil : $0! * 2 }
//        print("M2", m2)
//
//        let c1 = numbers.compactMap{ $0 == nil ? nil : $0! * 2 }
//        print("C1", c1)
//
//        // [1, nil, 2, 3, nil, 4]
//        let c2 = numbers.compactMap{ $0 }
//        print("C2", c2) // [Int]
//
//        let compactWithMap = numbers.compactMap{$0}.map{$0 * 5}
//        print(compactWithMap) // [Int]

        
        
        //MARK:- ComppactMap is as same as a Map but, major diff is ComplactMap will remove nill, optinal values form collection.

        var numbers = [1,2,nil,3,nil,4,5,nil,6,nil,7,8,nil,9,nil,nil]

        var c1: [Int] = []
        for num in numbers {
            if let number = num {
                if num == nil {
                    print("Nill Value")
                } else {
                    c1.append(number)
                }
            }
        }
        print("C1", c1)

        var c2: [Int] = numbers.compactMap { (num) in
            return num
        }
        print("C2", c2)

        let c3: [Int] = numbers.compactMap({$0})
        print("C3", c3)

        let c4: [Int] = numbers.compactMap{$0}
        print("C4", c4)

        //Now multiply the numbers array with 5.

        let c5: [Int] = numbers.compactMap({$0}).map({$0 * 5})
        print("C5", c5)

    }
    
    func flatMapPractice() {
        //MARK: - FlatMap - collection inside collection - merge karke single collection mai dega

//        var numbers: [[Int]] = [
//            [1,2,3],
//            [4,5,6],
//            [7,8,9]
//        ]
//
//        var tempArray: [Int] = []
//
//        for number in numbers {
//            tempArray += number // [1,2,3]
//        }
//        print(tempArray)
//
//        let f1 = numbers.flatMap{$0}
//        print(f1)
//
//        let m1 = numbers.flatMap{$0}.map{$0 * 5}
//        print(m1)
        
        
        //MARK:- Flat map is func that can merge the collection of collection into single colletion.

        var numbersArray:[[Int]] = [[1,2,3],[4,5,6],[7,8,9]]

        var f1: [Int] = []
        for numberArray in numbersArray {
           f1 = f1 + numberArray // f2 += numberArray
        }
        print("F1", f1)

        let f2: [Int] = numbersArray.flatMap { array in
            return array
        }
        print("F2", f2)

        let f3: [Int] = numbersArray.flatMap ({ $0 })

        print("F3", f3)

        let f4: [Int] = numbersArray.flatMap { $0 }

        print("F4", f4)

    }
    
    func filterPractice() {
        //
        let numbers = [1,4,6,8,2,3,5,9,0,7]

        /// Separate the even number form the list
        /// Even is sarisankya , Odd is Basisankya

        var tempArray: [Int] = []
        for num in numbers {
            if num % 2 == 0 {
                tempArray.append(num)
            } else {
                //        dump("Number is not Even Number")
            }
        }
        //print("Temp Array:",tempArray)

        let tempArray1 = numbers.filter { (num) -> Bool in
            return num % 2 == 0
        }
        //print("Temp Array 1:",tempArray1)

        let tempArray2 = numbers.filter { (num) in
            return num % 2 == 0
        }
        //print("Temp Array 2:",tempArray2)

        let tempArray3 = numbers.filter { (num) in
            num % 2 == 0
        }
        //print("Temp Array 3:",tempArray3)

        let tempArray4 = numbers.filter({$0 % 2 == 0})
        //print("Temp Array 4:",tempArray4)

        let tempArray5 = numbers.filter{$0 % 2 == 0}
        //print("Temp Array 5:",tempArray5)


        let evenArray = numbers.filter { (num) -> Bool in
            return num % 2 == 0
        }
        //print("Even Numbers Array is:",evenArray)

        let oddArray = numbers.filter { (num) -> Bool in
            return num % 2 != 0
        }
        //print("Odd Numbers Array is:",oddArray)

        let greaterThan5Array = numbers.filter { (num) -> Bool in
            return num > 5
        }
        //print("Greater Than 5 Numbers Array is:",greaterThan5Array)

        let lessThan5Array = numbers.filter { (num) -> Bool in
            return num < 5
        }
        //print("Greater Than 5 Numbers Array is:",lessThan5Array)

        //MARK:- Filter on Dictionary

        let bookAmount = ["Harrypotter": 100.0, "junglebook": 1000.0]

        print(bookAmount.filter({ (key, value) -> Bool in
            value > 100
        }))


        //MARK:- Filter on Set

        var bookSet: Set = [300.00, 400.00, 500.00]

        let returnFromSet = bookSet.filter { (num) -> Bool in
            num == 300
        }
        print(returnFromSet)

        let returnFromSet1 = bookSet.filter { $0 == 300 }

        print(returnFromSet1)
    }
    
    func reducePractice() {
        //MARK:- Use reduce to combine all items in a collection to create a single new value.

        let numbers = [1,4,6,8,2,3,5,9,0,7]

        var result = 0
        for num in numbers {
            result = result + num
        }
        //print(result)

        let reduceValue = numbers.reduce(0) { (result, num) -> Int in
            return result + num
        }
        //print("Reduce Value:",reduceValue)

        let reduceValue1 = numbers.reduce(0) { (result, num) in
            return result + num
        }
        //print("Reduce Value 1:",reduceValue1)

        let reduceValue2 = numbers.reduce(0) { (result, num) in
             result + num
        }
        //print("Reduce Value 2:",reduceValue2)

        let reduceValue3 = numbers.reduce(0) { ($0 + $1) }
        //print("Reduce Value 3:",reduceValue3)

        let reduceValue4 = numbers.reduce(0, { ($0 + $1) } )
        //print("Reduce Value 4:",reduceValue4)


        //MARK:- Reduce on Dictionary

        let codes = ["abc","def","ghi"]
        let text = codes.reduce("") { $0 + $1} //the result is "abcdefghi"
        let text1 = codes.reduce("",+) //the result is "abcdefghi"
        //dump(text)
        //dump(text1)

        let bookAmount = ["Harrypotter": 100.0, "junglebook": 1000.0]
        let reduceAmountOnDict = bookAmount.reduce(0) { (value, toupleOfKeyAndValue) in
        //    print(toupleOfKeyAndValue)
        //    print(toupleOfKeyAndValue.key)
        //    print(toupleOfKeyAndValue.value)
        //    print(value)
            return value + Int(toupleOfKeyAndValue.value)
        }
        print(reduceAmountOnDict)

        let reduceBookOnDict = bookAmount.reduce("Books in the Dict Are ") { (value, toupleOfKeyAndValue) in
            return value + toupleOfKeyAndValue.key + ","
        }
        print(reduceBookOnDict)

    }

    
    func dnreddy() {
        //MARK: - What are the different types of properties available?
        //Stored Properties
        //Computed Properties
        //Lazy Properties
        //Static Properties / Class Properties

        //MARK: - Type Inference or implicitly datatype declaration
        var typeInferInt = 10
        let typeInferString = "Shiva"


        //MARK: - Type Annotation or explicitly datatype declaration
        var typeAnnotationInt: Int = 10
        let typeAnnotationString: String = "Shiva"

        //MARK: - Touples
        // Touples are group of values into a single compound value/ single value.
        var toupleValue1 = ("Shiva", 32)
        //dump(toupleValue1.0)
        //dump(toupleValue1.1)

        var toupleValue2 = (name: "Shiva", age: 32)
        //dump(toupleValue2.name)
        //dump(toupleValue2.age)

        var (name, age) = ("Shiva", 32)
        //dump(name)
        //dump(age)

        //MARK: - String interpolation
        var stringInterpolationValue = "Hi World, My name is \(name), i am \(age) years old"
        //dump(stringInterpolationValue)

        // MARK: - Optionals
        // Optionals are the special data types that can holds the value of a variable or its absence/ nil value.
        // Optional are enum type, because this can hold some , none of a variable.
        // Optionals are must be declare with var.
        // Use ? to declare the optionals in swift.

        var optionaValue: String?
        //print("Before value assign:", optionaValue)
        //optionaValue = "Shiva"
        //print("After value assign:", optionaValue)

        // To extract the value from the optional value is a mechanisum/process of optional unwrapping.
        // We have multiple methods to unwrap the optional values

        // i. Implicit unwrapping
        // Process of conveying to the compiler that the optional variable will definitely contains a value before it is used.
        var implicitOptional: Int?
        // ii. Force unwrapping
        var forceOptional: Int!
        // iii. Explicit unwrapping (Optional Binding & guard statement)
        // Optional Binding
        // Optional binding is one of the optional unwrapping techniques.
        //The unwrapped value in optional binding is accessible with that block.
        var optionalBinding: Int?
        optionalBinding = 20
        //dump(optionalBinding)
        if let bindingValue = optionalBinding {
        //    dump(bindingValue)
        }
        // Guard is one of the optional unwrapping techniques
        // The unwrapped value in guard statement is accessible to the below statements.
        func callGuardMethod() {
            guard let bindingValue = optionalBinding else { return }
            dump(bindingValue)
        }
        //callGuardMethod()
        // Can we access the guard statement value in else block?
        // No, we cant access the value in else block because ut is avalable of the else block.
        //MARK: - Optional Chaining is process of accessing Optional’s sub properties which are again optionals.

        //let res = anOptional?.subOptional?.subOptional
        //let res = anOptional?.subOptional?.subOptional?.method()

        //MARK: - What is nil coalescing operator (??)?
        //Process of providing default value is optional doesn’t contain a value. Process of substituting a value if optional doesn’t contain a value.
        let anOptional: Int?
        anOptional = 10
        let unwrapped = anOptional ?? 0

         //MARK: - What are the new operators available in swift?

        /*
        i) Closed Range Operators (a...b)
        ii) Half Open Range operators (a..<b)
        iii) One sided open range operators (...n, n...) Nil coalescing operator (??)
        iv)Type Checking operator (is)
        v)Type Considering Operator (as)
        vi)Identify Operators (=== / !==)
        */

        //MARK: - What is enum & Syntax?
        // Enum is a keyword, which is used to define user defined datatype with user specified values.

        enum WeekDay {
        case MONDAY, TUESDAY, WEDNESDAY
        case THURSDAY
        case FRIDAY
        }
        //Enum with Raw Values:
        enum WeekDay1: Int {
        case MONDAY = 0, TUESDAY = 2, WEDNESDAY = 3
        case THURSDAY = 4
        case FRIDAY = 5
        }
        //Enum with Associated Values:
        //A enum case which is capable of holding additional information.
        enum Errors {
        case unknownError
        case httpError(Int, String)
        case networkError(String)
        }
        //Here, httpError case holds Int and String, networkError holds String


        //MARK: - What is Struct & Syntax?
        //struct is a keyword to create user defined datatype.structure variables are value types
        //Note: Swift structs does contain methods also.

        struct Structures {
            let name = "Shiva"
            let address = "Hyderabad"
            let age = 29
            
            func display() {
                print(name)
                print(age)
                print(address)
            }
        }

        let stru = Structures()
        //stru.display()

        //MARK: - What is mutating method?
        //The structure variables can’t be modified in structure methods. To modify properties of a structure we use mutating keyword as below.
        struct Book {
            var name = "Shiva"
            var price = 12.5
            mutating func modifyableMethod() {
                name = "Swift"
                price = 22.50
            }
        }
    }
    
//    func interviewTest() {
//        
//        protocol HumanDelegate: AnyObject {
//            func sendData()
//        }
//
//        class Human {
//            var name: String?
//            weak var delegate: HumanDelegate?
//            init(name: String?) {
//                self.name = name
//            }
//            func walk() {
//                delegate?.sendData()
//            }
//        }
//
//        class Men: HumanDelegate {
//            
//            func run() {
//                
//            }
//            
//            func sendData() {
//                print("Data got from Human")
//            }
//        }
//
//        //let human1 = Human(name: "Shiva")
//        //let men1 = Men()
//        //human1.delegate = men1
//        //human1.walk()
//
//
//        class Ploynedram {
//            
//            func checkIsPolyndram(pString: String) -> Bool {
//                var temp = ""
//                for str in pString {
//                    temp = "\(str)" + temp
//                }
//                return pString == temp ? true : false
//            }
//        }
//
//        let p1 = Ploynedram()
//        let result = p1.checkIsPolyndram(pString: "1")
//
//        //result == true ? print("Give string is Polyndram") : print("Give string is not Polyndram")
//
//        let reverstring = "Shiva"
//        var revStr = ""
//        for i in reverstring {
//            revStr = "\(i)" + revStr
//        }
//        //print(revStr)
//
//
//        //MARK: - Operations on array
//
//        var intArray = [1,2,3,1,5,2,3,6,8,4,9,6,7,8,9,4,5,6,2,4,6,1,2,3,5,9,8,8]
//
//        // find the duplicate ints and remove them from array
//        var temp = [Int]()
//        for val in intArray {
//            if !temp.contains(val) {
//                temp.append(val)
//            }
//        }
//        //print(temp)
//
//
//        // Find the highest number in array
//
//        var highestVal = 0
//        [1, 2, 3, 5, 6, 8, 4, 9, 7]
//        for i in intArray {
//            if highestVal <= i {
//                highestVal = i
//            }
//        }
//        //dump("The heights value in array is : \(highestVal)")
//
//        var lowestVal:Int = 0
//        for i in intArray {
//            if lowestVal <= i && lowestVal != 0 {
//            } else {
//                lowestVal = i
//            }
//        }
//        //dump("The low value in array is : \(lowestVal)")
//
//        // Array sum
//
//        let intar = [1, 2, 3, 5, 6, 8, 4, 9, 7] //= 45
//
//        var totla = 0
//
//        for i in intar {
//            totla = i + totla
//        }
//        print(totla)
//
//        //var motto = "Bow ties are cool"
//        //let res = motto.replacingOccurrences(of: "Bow", with: "Neck")
//        //print(motto)
//        //print(res)
//        //
//        //var numbers = [1, 2, 3]
//        //numbers += [4]
//        //print(numbers)
//
//
//        //Compile time error
//        //final class Dog {
//        //    func bark() {
//        //        print("Woof!")
//        //    }
//        //}
//        //
//        //class Corgi : Dog {
//        //    override func bark() {
//        //        print("Yip!")
//        //    }
//        //}
//        //
//        //let muttface = Corgi()
//        //muttface.bark()
//
//
//
//        //run time error
//        //for i in 3...1 {
//        //    print(i)
//        //}
//
//
//
//        //Explanation: Structs have memberwise initialization as standard, but this is not available to classes. The code will fail to compile because the Starship class has no initializers.
//        //class Starship {
//        //    var type: String
//        //    var age: Int
//        //}
//        //
//        //let serenity = Starship(type: "Firefly", age: 24)
//        //print(serenity.type)
//
//
//
//        //var i = 2
//        //
//        //do {
//        //    print(i)
//        //    i *= 2
//        //} while (i < 128)
//
//        //Explanation: The do keyword is invalid here; the programmer should use repeat instead.
//
//
//        //let i = 3
//        //
//        //switch i {
//        //case 1:
//        //    print("Number was 1")
//        //case 2:
//        //    print("Number was 2")
//        //case 3:
//        //    print("Number was 3")
//        //}
//
//        //Explanation: Swift requires all switch statements to be exhaustive. This code will not compile because it does not have a default clause.
//
//        let i = "5"
//        let j = i + i
//
//        print(j)
//
//
//        let names = ["narayna", "shiva", "Nani", "ram"]
//
//        let fileterArray = names.filter { str  in
//            str.lowercased().hasPrefix("n")
//        }
//
//        var temp = [String]()
//        for n in names {
//            if let firstLatter = n.first {
//                if firstLatter.lowercased() == "n" {
//                    temp.append(n)
//                }
//            }
//        }
//        print(temp)
//
//        let random = Int.random(in: 1...1000)
//        dump(random)
//
//
//        enum States {
//            case InActive
//            case Active
//            case Forword
//            case Backword
//            case Pause
//            case Stop
//        }
//
//        let state = States.Active
//
//        switch state {
//        case .Active:
//            dump("Active")
//        case .InActive:
//            dump("InActive")
//        case .Forword:
//            dump("Forword")
//        case .Backword:
//            dump("Backword")
//        case .Pause:
//            dump("Pause")
//        case .Stop:
//            dump("Stop")
//        }
//
//
//        enum StatesOfIndia: String, CaseIterable {
//            case andrapradesh
//            case telangana
//            case karnataka
//            case tamilanadu
//            case maharastra
//            case kerala
//        }
//
//        let myState = StatesOfIndia.allCases
//
//        for stat in myState {
//            dump(stat.rawValue)
//        }
//
//        var grades = [85, 74, 90, 64, 82]
//        let pass = grades.allSatisfy { grade -> Bool in
//            return grade > 50
//        }
//        dump(pass)
//
//        grades.removeAll { grade -> Bool in
//            return grade < 75
//        }
//        dump(grades)
//
//
//        let languages = ["English", "French", "Spanish", "Greek", "Chinese", "Turkish"]
//        var germanExists = false
//        for language in languages {
//            if language == "German" {
//                germanExists = true
//                break
//            }
//        }
//        dump(germanExists)
//
//    }
}
