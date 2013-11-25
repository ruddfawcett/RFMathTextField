RFMathTextField
===============

A simple validator/equation answerer.  Could be used to prevent spam (an extra form step) or prevent users from making stupid decisions at stupid times, when they are not thinking clearly, and can't do simple math.

##Installation

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like AFNetworking in your projects. See the ["Getting Started" guide for more information](https://github.com/AFNetworking/AFNetworking/wiki/Getting-Started-with-AFNetworking).

#### Podfile

```ruby
platform :ios, '7.0'
pod "RFMathTextField", "~> 1.1"
```

### Installation without CocoaPods

Just drag the RFMathTextField folder into your project and import it.

```
#import 'RFMathTextField.h'
```

## Use

RFMathTextField is very simple to install and use.  Just init the `RFMathTextField` with or without a notification*, and choose from one of the 4 types (RFMathTextFieldEquationTypes) of equations:

- `RFMathTextFieldEquationTypeAddition`
- `RFMathTextFieldEquationTypeSubtraction`
- `RFMathTextFieldEquationTypeMultiplication`
- `RFMathTextFieldEquationTypeRandom`

```objective-c
RFMathTextField *textField = [[RFMathTextField alloc] initWithFrame:CGRectMake(20, 100, 180, 31)
                                           withEquation:RFMathTextFieldEquationTypeAddition 
```

\* **If you initialize RFMathTextField with a notification, remmber to add an observer with the same name.**

That's really it, just add an observer if you're using notifications, so you can perform an action when the correct answer is input.

You can also always grab the answer to the equation (`NSInteger equationAnswer`) or if the answer is correct (`BOOL answerCorrect`).

Also, you can refresh the equation easily by calling
```
[textField refreshEquation];
```

Hope you enjoy it!

##Screenshots

![Screenshot 1](http://i.imgur.com/cRZJ1cf.png) 
![Screenshot 2](http://i.imgur.com/94S4q40.png)

##License

The MIT License (MIT)

Copyright (c) 2013 Rex Finn

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
