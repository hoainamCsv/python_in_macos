//
//  ContentView.swift
//  test_python_swift
//
//  Created by Cube System Vietnam on 30/03/2023.
//

import SwiftUI
import Python
import PythonKit
struct ContentView: View {
    init() {
        print("start test int Python")
        guard let stdLibPath = Bundle.main.path(forResource: "python-stdlib", ofType: nil) else {
            print("Error")
            return }
        guard let libDynloadPath = Bundle.main.path(forResource: "python-stdlib/lib-dynload", ofType: nil) else {
            print("Error")
            return }
        setenv("PYTHONHOME", stdLibPath, 1)
        setenv("PYTHONPATH", "\(stdLibPath):\(libDynloadPath)", 1)
        print("Py_Initialize...")
        Py_Initialize()
        
        let sys = Python.import("sys")
        print("Python Version: \(sys.version_info.major).\(sys.version_info.minor)")
        print("Python Encoding: \(sys.getdefaultencoding().upper())")
        print("Python Path: \(sys.path)")
        
        
        print("OKAY !")
        let math = Python.import("math") // verifies `lib-dynload` is found and signed successfully
        print("test python Math pow math.pow(9, 3): \(math.pow(9, 3))")
        
        
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
