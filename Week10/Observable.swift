//
//  Observable.swift
//  Week10
//
//  Created by 서동운 on 9/20/23.
//

import Foundation

class Observable<Value> {
    
    private var value: Value {
        didSet {
            listener?(value)
        }
    }
    
    private var listener: ((Value) -> Void)?
    
    init(_ value: Value, listener: ((Value) -> Void)? = nil) {
        self.value = value
        self.listener = listener
    }
    
    func bind(_ listener: @escaping (Value) -> Void) {
        self.listener = listener
        listener(value)
    }
}
