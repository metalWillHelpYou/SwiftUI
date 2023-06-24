//
//  LocationSearchResultSell.swift
//  UberClone
//
//  Created by metalwillhelpyou on 04.04.2023.
//

import SwiftUI

struct LocationSearchResultSell: View {
    let title: String
    let subTitle: String
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                
                Text(subTitle)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                Divider()
            }
            .padding(.leading,  8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

struct LocationSearchResultSell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResultSell(title: "Starbucks", subTitle: "Polská 1, 779 00 Olomouc")
    }
}
