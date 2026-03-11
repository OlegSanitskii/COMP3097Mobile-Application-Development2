import SwiftUI

struct DetailView: View {
    @State private var name: String?
    @State private var email: String = ""
    @State private var pwd: String = ""

    @State private var pwd2: String = ""
    @State private var isRemembered: Bool = false

    @State private var message: String = "Log in to continue"

    var body: some View {
        VStack(spacing: 20) {
            
            Text("Create account")
                .font(.largeTitle)
                .bold()
            Text(message)
                .foregroundStyle(.gray)
            TextField("Name (Optional)", text: Binding(
                get: { name ?? "" },
                set: { name = $0 }
                ))
                .padding(.horizontal)
            TextField("Email:", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            TextField("Password:", text: $pwd)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            TextField("Confirm Password:", text: $pwd2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("Create account") {
                if email.isEmpty {
                    message = "Please enter your email"
                } else if pwd.isEmpty{
                    message = "Please enter your password"
                
                } else if pwd2.isEmpty{
                    message = "Please confirm your password"
                }
                else if pwd != pwd2 {
                    message = "Password need to match"
                }
                    else {
                    message =
                    "Your account has been created successfully"
                }
            }
            
            NavigationLink("Back to login") {
                ContentView()
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}



