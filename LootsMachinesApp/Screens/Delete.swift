//
//  Delete.swift
//

import SwiftUI

struct Delete: View {
  @Binding var showDelete: Bool
  
    var body: some View {
      ZStack {
        Color(hex: "1C0035").opacity(0.8)
          .ignoresSafeArea()
        
        Image(.delslotbg)
          .resizableToFit()
          .overlay(.bottom) {
            HStack {
              Button {
                showDelete = false
              } label: {
                Image(.bbtn)
                  .resizableToFit(height: 54)
              }
              
              Button {
                // delete
                showDelete = false
              } label: {
                Image(.deletbtn)
                  .resizableToFit(height: 54)
              }
            }
            .yOffset(20)
          }
          .hPadding()
        
      }
    }
}

#Preview {
  Delete(showDelete: .constant(true))
}
