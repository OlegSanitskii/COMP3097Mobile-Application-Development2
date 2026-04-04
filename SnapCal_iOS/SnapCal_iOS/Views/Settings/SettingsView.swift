import SwiftUI

struct SettingsView: View {

    @State private var garminConnected = true

    var body: some View {

        ZStack {

            SnapCalTheme.background
                .ignoresSafeArea()

            ScrollView {

                VStack(alignment: .leading, spacing: 24) {

                    Text("Garmin Integration")
                        .font(.title2)
                        .fontWeight(.semibold)

                    HStack {

                        VStack(alignment: .leading) {

                            Text("Connect to Garmin")
                                .fontWeight(.semibold)

                            Text("Sync workouts, steps, heart rate")
                                .font(.caption)

                        }

                        Spacer()

                        Toggle("", isOn: $garminConnected)
                            .labelsHidden()

                    }

                    Divider()

                    account

                    Divider()

                    workouts

                    Divider()

                    heartRate

                }
                .padding(.horizontal, SnapCalTheme.screenHorizontalPadding)

            }

        }
    }

    private var account: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text("Account")
                .fontWeight(.semibold)

            Text("Guest session")
                .font(.caption)

            Button("Sign out") {

            }
            .foregroundStyle(.blue)

        }
    }

    private var workouts: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text("Recent Workouts")
                .fontWeight(.semibold)

            Text("Sep 26 • Cycling 45 min • 520 kcal")
            Text("Sep 25 • Running 30 min • 340 kcal")
            Text("Sep 23 • Strength 40 min • 280 kcal")

        }
    }

    private var heartRate: some View {

        VStack(alignment: .leading, spacing: 6) {

            Text("Heart Rate Summary")
                .fontWeight(.semibold)

            Text("Resting HR: 58 bpm")
            Text("Average HR (workouts): 138 bpm")
            Text("Max HR (last workout): 172 bpm")

        }
    }
}

#Preview {
    SettingsView()
}
