//
//  Views.Common.EmptyListView.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import SwiftUI
extension Views.Common {
    struct EmptyListView: View {
        var descriptionText : String = ""
        var body: some View {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Image(systemName: "list.bullet.clipboard.fill")
                        .resizable()
                        .frame(width: 90, height: 120)
                        .scaledToFit()
                        .foregroundColor(Color.gray)
                        .padding()
                    Text(descriptionText)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
struct Views_Common_EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        Views.Common.EmptyListView()
    }
}
