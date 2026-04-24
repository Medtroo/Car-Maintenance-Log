//
//  ContentView.swift
//  Car Maintenance Log
//
//  Created by Nika Metreveli on 3/22/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \MaintenanceEntry.date, order: .reverse) private var entries: [MaintenanceEntry]

    @State private var showingAddEntry = false
    @State private var selectedFilter: EntryFilter = .all
    @State private var searchText = ""
    @State private var selectedSort: EntrySortOption = .newest

    var totalEntries: Int {
        entries.count
    }

    var totalSpent: Double {
        entries.reduce(0) { $0 + $1.cost }
    }

    var filteredEntries: [MaintenanceEntry] {
        let categoryFiltered: [MaintenanceEntry]

        if selectedFilter == .all {
            categoryFiltered = entries
        } else {
            categoryFiltered = entries.filter { $0.serviceType == selectedFilter.rawValue }
        }

        let searchedEntries: [MaintenanceEntry]
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            searchedEntries = categoryFiltered
        } else {
            searchedEntries = categoryFiltered.filter {
                $0.carName.localizedCaseInsensitiveContains(searchText)
            }
        }

        switch selectedSort {
        case .newest:
            return searchedEntries.sorted { $0.date > $1.date }
        case .oldest:
            return searchedEntries.sorted { $0.date < $1.date }
        case .highestCost:
            return searchedEntries.sorted { $0.cost > $1.cost }
        case .highestMileage:
            return searchedEntries.sorted { $0.mileage > $1.mileage }
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                HStack(spacing: 12) {
                    StatCardView(
                        title: AppStrings.totalEntries,
                        value: "\(totalEntries)"
                    )

                    StatCardView(
                        title: AppStrings.totalSpent,
                        value: String(format: "$%.2f", totalSpent)
                    )
                }
                .padding(.horizontal)

                Picker("Filter", selection: $selectedFilter) {
                    ForEach(EntryFilter.allCases) { filter in
                        Text(filter.rawValue).tag(filter)
                    }
                }
                .pickerStyle(.menu)
                .padding(.horizontal)

                Picker("Sort", selection: $selectedSort) {
                    ForEach(EntrySortOption.allCases) { option in
                        Text(option.rawValue).tag(option)
                    }
                }
                .pickerStyle(.menu)
                .padding(.horizontal)

                if filteredEntries.isEmpty {
                    Spacer()

                    VStack(spacing: 12) {
                        Image(systemName: "car.fill")
                            .font(.system(size: 44))
                            .foregroundStyle(Color.appAccentBlue)

                        Text("No maintenance records yet")
                            .font(.headline)
                            .foregroundStyle(Color.appTextPrimary)

                        Text("Tap the + button to add your first entry.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.appSecondaryText)
                    }
                    .padding()

                    Spacer()
                } else {
                    List {
                        ForEach(filteredEntries) { entry in
                            NavigationLink {
                                EntryDetailView(entry: entry)
                            } label: {
                                EntryRowView(entry: entry)
                            }
                            .listRowBackground(Color.appCard)
                        }
                        .onDelete(perform: deleteEntries)
                    }
                    .searchable(text: $searchText, prompt: "Search by car name")
                    .scrollContentBackground(.hidden)
                    .background(Color.appBackground)
                }
            }
            .padding(.top, 12)
            .background(Color.appBackground)
            .navigationTitle(AppStrings.appTitle)
            .toolbar {
                ToolbarItem {
                    Button {
                        showingAddEntry = true
                    } label: {
                        Label(AppStrings.addEntry, systemImage: "plus")
                    }
                    .tint(Color.appAccentBlue)
                }
            }
            .sheet(isPresented: $showingAddEntry) {
                AddEntryView()
            }
        }
        .tint(Color.appAccentBlue)
    }

    private func deleteEntries(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(filteredEntries[index])
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: MaintenanceEntry.self, inMemory: true)
}
