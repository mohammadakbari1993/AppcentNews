//
//  Views.Common.SearchField.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import SwiftUI
extension Views.Common {
    struct SearchField: View {
        @Binding var text : String
        var placeHolder : String = ""
        var onSubmit: (() -> Void)?
        var body: some View {
            HStack {
                Image(systemName: "magnifyingglass.circle").foregroundColor(Color.gray)
                TextField(placeHolder, text: $text)
                    .foregroundColor(Color.black).font(.caption2)
                    .onSubmit {
                        (self.onSubmit ?? {})()
                    }
                
                Spacer()
                if !text.isEmpty {
                    Button {
                        text = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color.gray)
                    }
                }
                
            }
            .padding(12)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.5).foregroundColor(Color.black))
            .padding(.horizontal)
 
        }
    }
}
struct Views_Common_SearchField_Previews: PreviewProvider {
    static var previews: some View {
        Views.Common.SearchField(text: .constant(""))
    }
}
