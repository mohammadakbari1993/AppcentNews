//
//  Views.Common.Loading.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import Foundation
import SwiftUI

extension Views.Common {
    struct Loading: View {
        var body: some View {
            HStack {
                Spacer()
                ProgressView()
                Spacer()
            }
        }
    }
}

