# GenericMemento
Generic Memento Design Pattern, for all types (struct, class)

# Memento (Intro)
The memento pattern is used to capture the current state of an object and store it in such a manner that it can be restored at a later time without breaking the rules of encapsulation. Implementing the memento design pattern makes sense when you know that you would like to return to a previous state.

# Generic Memento
In this generic memento you can store and load any type of state, without the need of create new code for each memento. 

# How To Use It
1. Add the Caretaker.swift, Originator.swift and Memento.swift to your project 
2. when you want to save a state, create a new Originator with this state:
Originator(state: <#state-to-save#>)
3. when you want to update a state, use update method:
originator.updateState(<#new-state#>)
4. The CareTaker can backup, undo and show the history
