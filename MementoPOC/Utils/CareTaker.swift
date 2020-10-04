//
//  CareTaker.swift
//  MementoPOC
//
//  Created by Yoni Vizel on 9/30/20.
//  Copyright © 2020 Yoni Vizel. All rights reserved.
//

import Foundation

protocol CaretakerProtocol {
    associatedtype StateType
    var originator: Originator<StateType> { get }

    func backup()
    func undo()
    func showHistory()
}

/// The Caretaker doesn't depend on the Concrete Memento class. Therefore, it
/// doesn't have access to the originator's state, stored inside the memento. It
/// works with all mementos via the base Memento interface.
class Caretaker<StateType>: CaretakerProtocol {

    private lazy var mementos = [MementoProtocol]()
    internal var originator: Originator<StateType>

    init(originator: Originator<StateType>) {
        self.originator = originator
    }

    func backup() {
        print("Caretaker: Saving Originator's state...\n")
        mementos.append(originator.save())
    }

    func undo() {

        guard !mementos.isEmpty else {
            print("Caretaker: can't undo. no mementos left...\n")
            return
        }
        let removedMemento = mementos.removeLast()

        print("Caretaker: Restoring state to: " + removedMemento.name)
        originator.restore(memento: removedMemento)
    }

    func showHistory() {
        print("Caretaker: Here's the list of mementos:\n")
        mementos.forEach { print($0.name) }
    }
}
