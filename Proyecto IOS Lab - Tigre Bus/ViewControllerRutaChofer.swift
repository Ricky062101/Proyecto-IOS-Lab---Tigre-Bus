//
//  ViewControllerRutaChofer.swift
//  Proyecto IOS Lab - Tigre Bus
//
//  Created by iOSLabMini05 on 17/05/22.
//

import UIKit

class ViewControllerRutaChofer: UIViewController {
    @IBOutlet weak var botonRegresar: UIButton!
    
    @IBOutlet weak var botonInfo: UIButton!
    @IBAction func botonRegresar(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func alerta(){
        let dialogMessage = UIAlertController(title: "Informaciòn", message: "Seleccione una de las rutas para empezar a dar funcionamiento a la aplicaciòn", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
        
    }
    @IBAction func botonInfo(_ sender: UIButton) {
        alerta()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
