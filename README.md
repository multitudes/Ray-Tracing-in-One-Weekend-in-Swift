# Ray-Tracing-in-One-Weekend-in-Swift
Raytracer explorations based on the popular series 


This is the Swift version. I did a C version here: [Ray-Tracing-in-One-Weekend-in-C](()

## set up
It is possible but now usual to run swift from a makefile. Instead, for this project I will create a swift package.
```bash
swift package init --name inaweekend --type executable
```

it is interesting that like in C, swift will create intermediate files and even a .o file but those will be kept hidden in the .build directory. Actually to execute the program, you can just run `swift run` and it will create the .build directory, compile and run the program.
Or run the main.swift file directly with `swift Sources/main.swift`.  
But where is my executable? It is in the .build directory. You can run it with (in my case) `./.build/arm64-apple-macosx/debug/inaweekend`.  
Interestingly using `swift Sources/main.swift` will not create the executable in the .build directory. In this case swift will act as interpreter and run the code directly!

I do not need to have a file called main.swift. I can rename my file and add `@main` to the struct that contains the main function for the same effect but now my code can use an asynchronous entry point if required.  (NB I cannot use main.swift anymore in this case...)
```swift
@main
struct raytracinginaweekend {
  static func main() {
    print("Hello, world!")
  }
}
```

Enough for the setup. lets start coding.




