//
//  ViewControllerRutaTigreBuS.swift
//  Proyecto IOS Lab - Tigre Bus
//
//  Created by iOSLabMini05 on 17/05/22.
//

import UIKit

class ViewControllerRutaTigreBuS: UIViewController {
    
    var contador: Int = 0
    
    @IBOutlet weak var botonRuta4: UIButton!
    @IBAction func BotonRegresar(_ sender: UIButton) {
        contadorMas()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func contadorMas(){
        if contador != nil{
            contador += 1
            print(contador)
        }else{
            print("ESTA MAL XD")
        }
        
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
