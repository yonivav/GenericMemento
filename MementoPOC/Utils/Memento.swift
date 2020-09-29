//
//  Memento.swift
//  MementoPOC
//
//  Created by Yoni Vizel on 9/29/20.
//  Copyright © 2020 Yoni Vizel. All rights reserved.
//

import Foundation

/// The Memento interface provides a way to retrieve the memento's metadata,
/// such as creation date or name. However, it doesn't expose the Originator's
/// state.
protocol MementoProtocol {

    var name: String { get }
    var date: Date { get }
}

/// The Memento protocol contains the infrastructure for storing the
/// Originator's state.
class ConcreteMemento<StateType>: MementoProtocol {

    /// The Originator uses this method when restoring its state.
    private(set) var state: StateType
    private(set) var date: Date

    init(state: StateType) {
        self.state = state
        self.date = Date()
    }

    /// The rest of the methods are used by the Caretaker to display metadata.
    var name: String { return "\(type(of: state)) + " + date.description.suffix(14).prefix(8) }
}
