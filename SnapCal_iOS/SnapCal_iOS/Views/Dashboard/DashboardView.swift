import SwiftUI
import SwiftData

struct DashboardView: View {
    @EnvironmentObject private var session: AppSession

    var body: some View {
        ZStack {
            SnapCalTheme.background
                .ignoresSafeArea()

            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 28) {
                        headerSection
                        caloriesSection
                        statsSection
                        quickActionsSection
                        accountSection
                    }
                    .padding(.horizontal, SnapCalTheme.screenHorizontalPadding)
                    .padding(.top, 36)
                    .padding(.bottom, 24)
                }

                BottomTabBar(selected: .home) { tab in
                    // stub 
        
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    private var headerSection: some View {
        Text("Dashboard")
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(SnapCalTheme.textPrimary)
    }

    private var caloriesSection: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Calories (in vs out)")
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(SnapCalTheme.textPrimary)

            HStack(alignment: .center, spacing: 18) {
                RingChartView(progress: 0.72)
                    .frame(width: 108, height: 108)

                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 12) {
                        Text("In: 1,650 kcal")
                            .font(.system(size: 14))
                            .foregroundStyle(SnapCalTheme.textPrimary)

                        Text("Out: 700 kcal")
                            .font(.system(size: 14))
                            .foregroundStyle(SnapCalTheme.textPrimary)
                    }

                    Text("Balance: -950 kcal")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(SnapCalTheme.textPrimary)

                    HStack(spacing: 16) {
                        legendItem(color: SnapCalTheme.chartBlue, text: "Consumed")
                        legendItem(color: SnapCalTheme.chartGray, text: "Remaining")
                    }
                    .padding(.top, 4)
                }

                Spacer()
            }
        }
    }

    private var statsSection: some View {
        HStack(alignment: .top, spacing: 28) {
            MacroCard(
                title: "Steps",
                value: "6,842",
                subtitle: "Goal: 8,000"
            )

            MacroCard(
                title: "Workouts",
                value: "Cycling 45 min",
                subtitle: "Burned: 520 kcal"
            )
        }
    }

    private var quickActionsSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Quick Actions")
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(SnapCalTheme.textPrimary)

            HStack(spacing: 12) {
                quickActionFilled(title: "Scan\nLabel")
                quickActionOutlined(title: "Log\nMeal")
                quickActionOutlined(title: "Progres\ns")
            }
        }
    }

    private var accountSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Account")
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(SnapCalTheme.textPrimary)

            Button {
                session.signOut()
            } label: {
                Text("Sign out")
                    .font(.system(size: 17, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .background(SnapCalTheme.danger)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
            }
        }
    }

    private func legendItem(color: Color, text: String) -> some View {
        HStack(spacing: 6) {
            RoundedRectangle(cornerRadius: 2)
                .fill(color)
                .frame(width: 12, height: 12)

            Text(text)
                .font(.system(size: 13))
                .foregroundStyle(SnapCalTheme.textSecondary)
        }
    }

    private func quickActionFilled(title: String) -> some View {
        Button {
        } label: {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(SnapCalTheme.primary)
                .foregroundStyle(.white)
                .clipShape(Capsule())
        }
    }

    private func quickActionOutlined(title: String) -> some View {
        Button {
        } label: {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color.clear)
                .foregroundStyle(SnapCalTheme.primary)
                .overlay(
                    Capsule()
                        .stroke(SnapCalTheme.border, lineWidth: 1)
                )
        }
    }
}

private struct RingChartView: View {
    let progress: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(SnapCalTheme.chartGray, lineWidth: 12)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    SnapCalTheme.chartBlue,
                    style: StrokeStyle(lineWidth: 12, lineCap: .butt)
                )
                .rotationEffect(.degrees(-90))
        }
    }
}

#Preview {
    NavigationStack {
        DashboardView()
            .environmentObject({
                let session = AppSession()
                session.signIn(email: "oleg@example.com", remember: true)
                return session
            }())
    }
}
