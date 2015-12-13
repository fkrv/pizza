//
//  VistaConfirmacion.swift
//  pizza
//
//  Created by Angel Agustín Martínez on 12/12/15.
//  Copyright © 2015 Angel Agustín Martínez. All rights reserved.
//

import UIKit

class VistaConfirmacion: UIViewController {
    
    @IBOutlet weak var tamaño: UILabel!
    @IBOutlet weak var masa: UILabel!
    @IBOutlet weak var queso: UILabel!
    @IBOutlet weak var ingredientes: UILabel!
    
    var tamañoElegido = ""
    var masaElegida = ""
    var quesoElegido = ""
    var ingredientesElegidos = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        tamaño.text = tamañoElegido
        masa.text = masaElegida
        queso.text = quesoElegido
        ingredientes.text = ingredientesElegidos
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
