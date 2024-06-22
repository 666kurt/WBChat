//
//  ActiveUsersWidgetBundle.swift
//  ActiveUsersWidget
//
//  Created by Максим Шишлов on 21.06.2024.
//

import WidgetKit
import SwiftUI

@main
struct ActiveUsersWidgetBundle: WidgetBundle {
    var body: some Widget {
        ActiveUsersWidget()
        ActiveUsersWidgetLiveActivity()
    }
}
