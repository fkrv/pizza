//
//  VistaQueso.swift
//  pizza
//
//  Created by Angel Agustín Martínez on 12/12/15.
//  Copyright © 2015 Angel Agustín Martínez. All rights reserved.
//

import UIKit

class VistaQueso: UIViewController,
    UIPickerViewDataSource,
    UIPickerViewDelegate,
    UIPickerViewAccessibilityDelegate {

    enum ComponentesEnPicker: Int {
        case quesos = 0
        
        static var count: Int {
            return ComponentesEnPicker.quesos.rawValue + 1
        }
    }
    
    enum Queso: Int {
        case Mozarela = 0, Cheddar, Parmesano, SinQueso
        
        init() {
            self = .SinQueso
        }
        
        static var count: Int {
            return Queso.SinQueso.rawValue + 1
        }
        
        func getEtiqueta() -> String{
            var etiqueta = ""
            
            switch(self){
            case .Mozarela:
                etiqueta = "Mozarela"
            case .Cheddar:
                etiqueta = "Cheddar"
            case .Parmesano:
                etiqueta = "Parmesano"
            case .SinQueso:
                etiqueta = "Sin queso"
            }
            
            return etiqueta
        }
        
        func getValor() -> Int {
            return self.rawValue
        }
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    lazy var numeroDeValoresPorComponente: Int = Queso.count
    var quesoElegido : Queso = .SinQueso
    
    var tamañoElegido = "";
    var masaElegida = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func configurePickerView() {
        // Show that a given row is selected. This is off by default.
        pickerView.showsSelectionIndicator = true
        
        // Set the default selected rows.
        let filas: [ComponentesEnPicker: Int] = [.quesos: 1]
        
        for (scrollQuesos, filaSeleccionada) in filas {
            /*
            Note that the delegate method on `UIPickerViewDelegate` is not triggered
            when manually calling `selectRow(_:inComponent:animated:)`. To do
            this, we fire off delegate method manually.
            */
            pickerView.selectRow(filaSeleccionada, inComponent: scrollQuesos.rawValue, animated: true)
        }
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return ComponentesEnPicker.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numeroDeValoresPorComponente
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        var title = NSMutableAttributedString(string: "")
        switch (row ) {
        case 0:
            quesoElegido = .Mozarela
        case 1:
            quesoElegido = .Cheddar
            break
        case 2:
            quesoElegido = .Parmesano
            break
        default:
            quesoElegido = .SinQueso
        }
        
        title = NSMutableAttributedString(string: quesoElegido.getEtiqueta() )
        
        return title
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let siguienteVista = segue.destinationViewController as! VistaIngredientes
        siguienteVista.tamañoElegido = self.tamañoElegido
        siguienteVista.masaElegida = self.masaElegida
        siguienteVista.quesoElegido = self.quesoElegido.getEtiqueta()
    }
}
