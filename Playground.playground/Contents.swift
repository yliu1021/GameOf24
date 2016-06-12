class Foo {
    var x: Int
    init(x: Int) {
        self.x = x;
    }
}

var array = [Foo](count: 10, repeatedValue: Foo(x: 4))
array[0].x = 6
array[2].x

array.removeAll()
