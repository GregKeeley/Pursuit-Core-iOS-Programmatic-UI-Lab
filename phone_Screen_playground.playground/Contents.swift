import UIKit

var numArray = [9,1,2,3,4]

func findLargestnum(arr: [Int]) -> Int {
    guard !numArray.isEmpty else { return 0 }
    var currentLargestNum = arr.first
    for num in arr {
        if num > currentLargestNum!  {
            currentLargestNum = num
        }
    }
    return currentLargestNum!
}

findLargestnum(arr: numArray)
