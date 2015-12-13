//
//  VistaMasa.swift
//  pizza
//
//  Created by Angel Agustín Martínez on 11/12/15.
//  Copyright © 2015 Angel Agustín Martínez. All rights reserved.
//

import UIKit

class VistaMasa: UIViewController,
    UIPickerViewDataSource,
    UIPickerViewDelegate,
    UIPickerViewAccessibilityDelegate {

    enum ComponentesEnPicker: Int {
        case masas = 0
        
        static var count: Int {
            return ComponentesEnPicker.masas.rawValue + 1
        }
    }
    
    enum Masa: Int {
        case Delgada = 0, Crujiente, Gruesa
        
        init() {
            self = .Delgada
        }
        
        static var count: Int {
            return Masa.Gruesa.rawValue + 1
        }
        
        func getEtiqueta() -> String{
            var etiqueta = ""
            
            switch(self){
            case .Delgada:
                etiqueta = "Delgada"
            case .Crujiente:
                etiqueta = "Crujiente"
            case .Gruesa:
                etiqueta = "Gruesa"
            }
            
            return etiqueta
        }
        
        func getValor() -> Int {
            return self.rawValue
        }
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    lazy var numeroDeValoresPorComponente: Int = Masa.count
    var masaElegida : Masa = .Delgada
    
    var tamañoElegido = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configurePickerView()
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
        let filas: [ComponentesEnPicker: Int] = [.masas: 1]
        
        for (scrollMasas, filaSeleccionada) in filas {
            /*
            Note that the delegate method on `UIPickerViewDelegate` is not triggered
            when manually calling `selectRow(_:inComponent:animated:)`. To do
            this, we fire off delegate method manually.
            */
            pickerView.selectRow(filaSeleccionada, inComponent: scrollMasas.rawValue, animated: true)
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
            masaElegida = .Delgada
            break
        case 1:
            masaElegida = .Crujiente
            break
        default:
            masaElegida = .Gruesa
        }
        
        title = NSMutableAttributedString(string: masaElegida.getEtiqueta() )
        
        return title
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let siguienteVista = segue.destinationViewController as! VistaQueso
        siguienteVista.tamañoElegido = self.tamañoElegido
        siguienteVista.masaElegida = self.masaElegida.getEtiqueta()
    }
}
