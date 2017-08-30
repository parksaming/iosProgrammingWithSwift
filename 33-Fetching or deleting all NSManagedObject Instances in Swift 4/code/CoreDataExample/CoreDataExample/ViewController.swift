//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Nguyen Duc Hoang on 8/30/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnAddData(sender: UIButton) {
        let department = DepartmentMO.insertNewDepartment(address: "An example address", city: "Hanoi", name: "Sales Department", zipCode: 123456)
        var employees = Set<EmployeeMO>()
        if let employee1 = EmployeeMO.insertNewImployee(name: "Employee name 1",
                                                     dateOfBirth: NSDate.calculateDate(day: 1, month: 1, year: 1990),
                                                     hireDate: NSDate(),
                                                     identifier: "A0001",
                                                     isManager: true,
                                                     title: "Sale manager 1") {
            employee1.department = department
            employees.insert(employee1)
        }
        if let employee2 = EmployeeMO.insertNewImployee(name: "Employee name 2",
                                                        dateOfBirth: NSDate.calculateDate(day: 2, month: 2, year: 1990),
                                                        hireDate: NSDate(),
                                                        identifier: "A0002",
                                                        isManager: true,
                                                        title: "Sale manager 2") {
            employee2.department = department
            employees.insert(employee2)
        }
        if let employee3 = EmployeeMO.insertNewImployee(name: "Employee name 3",
                                                        dateOfBirth: NSDate.calculateDate(day: 3, month: 3, year: 1991),
                                                        hireDate: NSDate(),
                                                        identifier: "A0003",
                                                        isManager: true,
                                                        title: "Sale manager 3") {
            employee3.department = department
            employees.insert(employee3)
        }
        department?.addToEmployees(employees as NSSet!)
    }
    @IBAction func btnFetchData(sender: UIButton) {
        let employees = EmployeeMO.getAllEmployee()
//        print("employees list: \(employees)")
        if employees.count == 0 {
            print("No employees founded")
            return
        }
        for employee in employees {
            //print("employee = \(employee.description)")
            print("employee's name = \(employee.name ?? "")")
        }
    }
    @IBAction func btnDeleteAllEmployees(sender: UIButton) {
        EmployeeMO.deleteAllEmployees()
    }
}

