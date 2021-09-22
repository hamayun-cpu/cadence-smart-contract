
access(all) contract HelloWorld {
    pub resource interface HasCount {
        pub count: Int
    }

    // Declare a resource named `Counter`, which has a writeable `count` field,
    // and conforms to the resource interface `HasCount`
    //
    pub resource Counter: HasCount {
        pub var count: Int
        

        init(count: Int) {
            self.count = count
        }

        pub fun increment() {
            self.count = self.count + 1
        }
    }
    // Declare a public field of type String.
    //
    // All fields must be initialized in the init() function.
    access(all) let greeting: String
    pub let counter: @Counter

    // The init() function is required if the contract contains any fields.
    init() {
        self.greeting = "Hello, World!"
        self.counter <- create Counter(count: 42)
        self.counter.increment()
        self.counter.increment()
    }

    // Public function that returns our friendly greeting!
    access(all) fun hello(): Int {
        return self.counter.count;
    }
}
