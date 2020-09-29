//
//  Originator.swift
//  MementoPOC
//
//  Created by Yoni Vizel on 9/30/20.
//  Copyright © 2020 Yoni Vizel. All rights reserved.
//

import Foundation

protocol OriginatorProtocol {
    associatedtype StateType
    var state: StateType { get }
    
    func updateState(_ newState: StateType)
    func save() -> MementoProtocol
    func restore(memento: MementoProtocol)
}

/// The Originator holds some important state that may change over time. It also
/// defines a method for saving the state inside a memento and another method
/// for restoring the state from it.
class Originator<StateType>: OriginatorProtocol {

    /// For the sake of simplicity, the originator's state is stored inside a
    /// single variable.
    internal var state: StateType

    init(state: StateType) {
        self.state = state
        print("Originator: My initial state is: \(state)")
    }

    /// The Originator's business logic may affect its internal state.
    /// Therefore, the client should backup the state before launching methods
    /// of the business logic via the save() method.
    func updateState(_ newState: StateType) {
        state = newState
        print("Originator: and my state has changed to: \(state)")
    }

    /// Saves the current state inside a memento.
    func save() -> MementoProtocol {
        return ConcreteMemento(state: state)
    }

    /// Restores the Originator's state from a memento object.
    func restore(memento: MementoProtocol) {
        guard let memento = memento as? ConcreteMemento<StateType> else { return }
        self.state = memento.state
        print("Originator: My state has changed to: \(state)")
    }
}
