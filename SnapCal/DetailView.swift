import SwiftUI

struct DetailView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var pwd: String = ""
    @State private var pwd2: String = ""
    @State private var message: String = "Create your SnapCal account"

    var body: some View {
        VStack(spacing: 20) {
            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(message)
                .foregroundStyle(.gray)

            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $pwd)
                .textFieldStyle(.roundedBorder)

            SecureField("Confirm Password", text: $pwd2)
                .textFieldStyle(.roundedBorder)

            Button("Register") {
                if name.isEmpty || email.isEmpty || pwd.isEmpty || pwd2.isEmpty {
                    message = "Please fill in all fields"
                } else if pwd != pwd2 {
                    message = "Passwords do not match"
                } else {
                    message = "Account created successfully"
                }
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
        .navigationTitle("Sign Up")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
