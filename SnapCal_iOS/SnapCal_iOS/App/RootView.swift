import SwiftUI

struct RootView: View {
    @EnvironmentObject private var session: AppSession

    var body: some View {
        NavigationStack {
            if session.isLoggedIn {
                DashboardView()
            } else {
                switch session.authScreen {
                case .login:
                    LoginView()
                case .signUp:
                    SignUpView()
                }
            }
        }
    }
}

#Preview {
    RootView()
        .environmentObject(AppSession())
}
