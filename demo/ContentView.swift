import SwiftUI

struct ContentView: View {

    @State private var name: String = ""
    @State private var email: String = ""
    @State private var pwd: String = ""
    @State private var pwd2: String = ""
    @State private var isRemembered: Bool = false
    @State private var message: String = "Log in to continue"


    var body: some View {
        NavigationStack {
            VStack {
                
                Text("SnapCal")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(message)
                    .foregroundStyle(.gray)
                
                TextField("Email:", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                TextField("Password:", text: $pwd)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                //switch
             
                   
                HStack {
                    Image(systemName: isRemembered ? "checkmark.square" : "square")
                        .onTapGesture {
                            isRemembered.toggle()
                        }

                    Text("Remember me")
                }
                .padding(.horizontal)
                
             
                Button("Login") {
                    if email.isEmpty {
                        message = "Please enter your email"
                    } else if pwd.isEmpty{
                        message = "Please enter your password"
                    }
                        else {
                        message =
                        isRemembered
                        ? "Thank you \(email)! you are remembered"
                        : "Hello, \(email)! you are not remembered"
                    }
                }
                .buttonStyle(.borderedProminent)
                /*create dashboard navigation when
                 continue as guest or login successfully*/
                
                
                
                NavigationLink("Create an account") {
                    DetailView()
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
