//
//  LockScreenWidgetBundle.swift
//  LockScreenWidget
//
//  Created by Suvass Ravala on 2/18/23.
//

import WidgetKit
import SwiftUI

@main
struct LockScreenWidgetBundle: WidgetBundle {
    var body: some Widget {
        LockScreenWidget()
        LockScreenWidgetLiveActivity()
    }
}
