class List<T> {
    var value: T
    var next: List<T>?

    init(val: T) {
        value = val
    }
    init(_ arr: T...) {
        value = arr[0]
        var start = self
        for i in 1..<arr.count {
            let node = List<T>(arr[i])
            start.next = node
            start = start.next!
        }
    }

}

extension List {
    subscript(index: Int ) -> T? {
        var index = index
        var start = self
        while index > 0 {
            if let next = start.next{
                start = next
            }
            else{
                print("Index out of bounds!")
                return nil
            }
            index -= 1
        }
        return start.value
    }
}

extension List {
    var length: Int {
            var count = 0
            var start = self
            while let next = start.next {
                start = next
                count += 1;
            }

            return count + 1
        }
}


extension List {
      func reverse() {
          var arr : [T] = []
          var start = self
          while let next = start.next {
              arr.append(start.value)
              start = next
          }
          arr.append(start.value)
          var count = arr.count;
          var it = self
          while (it.next != nil) {
              it.value = arr[count - 1]
              it = it.next!
              count -= 1
          }
          it.value = arr[0]

    }
}

extension List where T:Equatable {
      func toSet() {
          var arr : [T] = []
          var start = self
          while let next = start.next {
              if !arr.contains(start.value) {
                  arr.append(start.value)
              }
              start = next
          }
          if !arr.contains(start.value) {
              arr.append(start.value)
          }
        
          var start2 = self
          value = arr[0]
          for i in 1..<arr.count {
              let node = List<T>(arr[i])
              start2.next = node
              start2 = start2.next!
          }

        }

}
