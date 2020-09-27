import UIKit
import FloatingPanel

protocol ViewControllerDelegate {
    func modalWillBegin(sendText: String)
}
class SemiModalViewController: UIViewController ,ViewControllerDelegate{
    var floatingPanelController: FloatingPanelController!
    let viewController = ViewController()
    var textA:String!
    var textButton:UIButton!
    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        textLabel.text = text
//        self.viewController.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        textLabel.text = textA
        print(textA ?? "空")
    }
    func modalWillBegin(sendText: String) {
        print(sendText)
        textA = sendText
    }
}
