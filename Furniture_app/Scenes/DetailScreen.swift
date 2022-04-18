//
//  DetailScreen.swift
//  Furniture_app
//
//  Created by 진혜림 on 2022/04/18.
//

import SwiftUI

struct DetailScreen: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var body: some View {
    ZStack {
      Color("Bg")
        .edgesIgnoringSafeArea(.all)
      
      ScrollView {
        Image("chair_1")
          .resizable()
          .aspectRatio(contentMode: .fit)
        
        DescriptionView()
          .offset(y: -40)
      }
      .edgesIgnoringSafeArea(.top)
      
      HStack {
        Text("$1299")
          .font(.title)
          .foregroundColor(Color.white)
        
        Spacer()
        
        Button(action: {}, label: {
          Text("Add to Cart")
            .padding()
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(10.0)
            .foregroundColor(Color("Primary"))
        })
      }
      .padding()
      .padding(.horizontal)
      .background(Color("Primary"))
      .cornerRadius(50, corners: .topLeft)
      .frame(maxHeight: .infinity, alignment: .bottom)
    }
    .edgesIgnoringSafeArea(.bottom)
    .navigationBarBackButtonHidden(true)
    .toolbar(content: {
      ToolbarItem(placement: .navigationBarLeading) {
        CustomBackButtonView(action: {
          presentationMode.wrappedValue.dismiss()
        })
      }
      ToolbarItem(placement: .navigationBarTrailing) {
        Image("threeDot")
      }
    })
  }
}


struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}

struct RoundedCorner: Shape {
  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .allCorners
  
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    return Path(path.cgPath)
  }
}

extension View {
  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape(RoundedCorner(radius: radius, corners: corners))
  }
}

struct DescriptionView: View {
  var body: some View {
    VStack(alignment: .leading) {
      Text("Luxury Swedia \nChair")
        .font(.title)
        .fontWeight(.bold)
      
      HStack {
        ForEach(0 ..< 5) { _ in
          Image("star")
        }
        Text("(4.9)")
          .opacity(0.5)
          .padding(.leading, 8)
        Spacer()
      }
      
      Text("Description")
        .fontWeight(.medium)
        .padding(.vertical, 8)
      
      Text("Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. it carries on the simplicity and honestly of the archetypical chair.")
        .lineSpacing(8.0)
        .opacity(0.6)
      
      HStack(alignment: .top) {
        VStack(alignment: .leading) {
          Text("Size")
            .fontWeight(.semibold)
            .padding(.bottom, 4)
          Text("Height: 120 cm")
            .opacity(0.6)
          Text("Wide: 80 cm")
            .opacity(0.6)
          Text("Diameter: 72 cm")
            .opacity(0.6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
        VStack(alignment: .leading) {
          Text("Treatment")
            .fontWeight(.semibold)
            .padding(.bottom, 4)
          Text("Jati Wood, Canvas, \nAmazing Love")
            .opacity(0.6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
      }
      .padding(.vertical)
      
      HStack(alignment: .bottom) {
        VStack(alignment: .leading) {
          Text("Colors")
            .fontWeight(.semibold)
          
          HStack {
            ColorDotView(color: .white)
            ColorDotView(color: .black)
            ColorDotView(color: Color("Primary"))
          }
        }
        
        Spacer()
        
        VStack(alignment: .leading) {
          Text("Quantity")
            .fontWeight(.semibold)
          
          HStack {
            Button(action: {}, label: {
              Image(systemName: "minus")
                .frame(width: 30, height: 30)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                .foregroundColor(.black)
            })
            
            Text("1")
              .font(.title2)
              .fontWeight(.semibold)
              .padding(.horizontal, 8)
            
            Button(action: {}, label: {
              Image(systemName: "plus")
                .frame(width: 30, height: 30)
                .background(Color("Primary"))
                .clipShape(Circle())
                .foregroundColor(.white)
            })
          }
        }
      }
    }
    .padding()
    .padding(.top)
    .background(Color("Bg"))
    .cornerRadius(40.0)
  }
}

struct ColorDotView: View {
  let color: Color
  var body: some View {
    color
      .frame(width: 24, height: 24)
      .clipShape(Circle())
  }
}

struct CustomBackButtonView: View {
  let action: () -> Void
  var body: some View {
    Button(action: action, label: {
      Image(systemName: "chevron.backward")
        .padding(.all, 12)
        .background(Color.white)
        .foregroundColor(Color("Primary"))
        .cornerRadius(8.0)
    })
  }
}
