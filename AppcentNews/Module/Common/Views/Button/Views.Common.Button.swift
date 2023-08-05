//
//  Views.Common.Button.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import SwiftUI
extension Views.Common {
    struct AppcentButton: View {
        
        var title : String?
        var action : (() -> Void)?
        
        var body: some View {
            VStack {
               
                Button {
                    (action ?? {})()
                } label: {
                    HStack {
                        Spacer()
                        Text(title ?? "").font(.headline)
                        Spacer()
                    }
                    .frame(height: 50)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }

                
            }
        }
        
    }
}
struct Views_Common_Button_Previews: PreviewProvider {
    static var previews: some View {
        Views.Common.AppcentButton(title: "My title", action: {}).padding()
    }
}
