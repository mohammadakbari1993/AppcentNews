//
//  Views.Common.ImageHolder.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import SwiftUI
extension Views.Common {
    struct ImageHolder: View {
        var image : String = ""
        var body: some View {
            
            VStack {
                if let url = URL(string: image) {
                    AsyncImage(
                        url: url,
                        content: { image in
                            image.resizable()
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                } else {
                    Image(image)
                        .resizable()
                        .foregroundColor(Color.gray)
                        .padding()
                }
            }
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .gray, radius: 5)
        }
    }
}
struct Views_Common_ImageHolder_Previews: PreviewProvider {
    static var previews: some View {
        Views.Common.ImageHolder()
            .frame(width: 100, height: 100)
        
            
    }
}
