//
//  NavigationBar.swift
//  NC2
//
//  Created by Haris Fadhilah on 27/07/22.
//

import SwiftUI

struct NavigationBar: ViewModifier {
    
    var backgroundColor: UIColor
    var textColor: UIColor
    
    init(backgroundColor: UIColor, textColor: UIColor) {
      self.backgroundColor = backgroundColor
      self.textColor = textColor
      let coloredAppearance = UINavigationBarAppearance()
      coloredAppearance.configureWithTransparentBackground()
      coloredAppearance.backgroundColor = .clear
      coloredAppearance.titleTextAttributes = [.foregroundColor: textColor]
      coloredAppearance.largeTitleTextAttributes = [.foregroundColor: textColor]

      UINavigationBar.appearance().standardAppearance = coloredAppearance
      UINavigationBar.appearance().compactAppearance = coloredAppearance
      UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
      UINavigationBar.appearance().tintColor = textColor
    }
    
    
    func body(content: Content) -> some View {
      ZStack{
         content
          VStack {
            GeometryReader { geometry in
               Color(self.backgroundColor)
                  .frame(height: geometry.safeAreaInsets.top)
                  .edgesIgnoringSafeArea(.top)
                Spacer()
            }
          }
       }
    }
    
}

extension View {
  func navigationBarColor(_ backgroundColor: UIColor, textColor: UIColor) -> some View {
    self.modifier(NavigationBar(backgroundColor: backgroundColor, textColor: textColor))
  }
}

extension View {
  var primaryNavigation: some View {
      self.navigationBarColor(UIColor(red: 17/255, green: 59/255, blue: 73/255, alpha: 1), textColor: UIColor.white)
  }
}

class HostingController<Content> : UIHostingController<Content> where Content : View {
  @objc override dynamic open var preferredStatusBarStyle: UIStatusBarStyle {
     return .lightContent
  }
}
