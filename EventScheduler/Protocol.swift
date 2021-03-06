//
//  Protocol.swift
//  EventScheduler
//
//  Created by Robson Strabeli de Camargo Miranda on 2017-10-26.
//  Copyright © 2017 stra015@algonquinlive.com. All rights reserved.
//

import Foundation

//Passing Event Back to the Caller
protocol EventPassingDelegate {
    func passEventBack(event: Event)
}
