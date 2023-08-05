//
//  Views.Common.ImageHolder.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import SwiftUI
import SDWebImageSwiftUI

extension Views.Common {
    struct ImageHolder: View {
        var image : String = ""
        var body: some View {
            
            VStack {
                if let url = URL(string: image) {
                    WebImage(url: url)
                        .resizable()
                        .placeholder {
                            Image(systemName: "photo")
                                .foregroundColor(Color.gray)
                                .padding()
                        }
                        .indicator(.activity) // Activity Indicator
                        .transition(.fade(duration: 0.5))
  
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
