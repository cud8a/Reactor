# Reactor
A small Swift ReactiveCocoa 5 example

Tried ReactiveCocoa 5 for the first time and it is as nice as expected.

What it does: reacts to user input and reverses the string, everyting done with ReactiveCocoa

    let signal = inputText
            .reactive
            .continuousTextValues
            .skipNil()
            .map{String($0.characters.reversed())}
        
    signal.observeValues { value in
        self.output.text = value
    }
        
    btn.reactive
        .controlEvents(.touchUpInside)
        .observe { value in
            self.inputText.resignFirstResponder()
    }
