//
//  ContentView.swift
//  ToDoAppUsingSwiftData
//
//  Created by G Ajay on 13/03/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Expense.date) var expenses: [Expense]
    @Environment(\.modelContext) var context
    @State private var isShowingItemsList = false
    @State private var updateExpense: Expense?

    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { expense in
                    expenseCell(expense)
                        .onTapGesture {
                            updateExpense = expense
                        }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(expenses[index])
                    }
                }
            }
            .navigationTitle("Expenses")
            .toolbar {
                if !expenses.isEmpty {
                    Button("Add Expense", systemImage: "plus") {
                        isShowingItemsList = true
                    }
                }
            }
            .sheet(isPresented: $isShowingItemsList) {
                ExpenseSheetView()
            }
            .sheet(item: $updateExpense) { expense in
                UpdateExpenseSheet(expense: expense)
            }
            .overlay {
                if expenses.isEmpty {
                    ContentUnavailableView(
                        label: { Label("No Expenses Found", systemImage: "list.bullet") },
                        description: { Text("Start adding expenses to the list") },
                        actions: {
                            Button("Add Expense") {
                                isShowingItemsList = true
                            }
                        }
                    )
                }
            }
        }
    }
    
    func expenseCell(_ expense: Expense) -> some View {
        HStack {
            Text(expense.date, format: .dateTime.month(.abbreviated).day())
                .frame(width: 100, alignment: .leading)
            Text(expense.name)
            Spacer()
            Text(expense.value, format: .currency(code: "inr"))
        }
    }
}

struct ExpenseSheetView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @State private var name: String = ""
    @State private var date: Date = Date()
    @State private var value: Int = 0
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                TextField("Amount", value: $value, format: .currency(code: "inr"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New Expense")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let expense = Expense(name: name, date: date, value: value)
                        context.insert(expense)
//                        try! context.save()
                        dismiss()
                    }
                }
            }
        }
    }
}

struct UpdateExpenseSheet: View {
    @Bindable var expense: Expense
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $expense.name)
                DatePicker("Date", selection: $expense.date, displayedComponents: .date)
                TextField("Amount", value: $expense.value, format: .currency(code: "inr"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Update Expense")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}
//
//#Preview {
//    ContentView()
//}
