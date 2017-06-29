import Alamofire
import SwiftyJSON

class AlamoController : NSObject{

	func getAlamofire(model:ChainCodeAccessModel, completionHandler: @escaping (NSDictionary?, Error?) -> ()) {
		blockchainQuery(model:model,completionHandler: completionHandler)
	}
	
	func blockchainQuery(model:ChainCodeAccessModel,completionHandler: @escaping (NSDictionary?, Error?) -> ()) {
		var request = URLRequest(url: URL(string: model.url)!)
		request.httpMethod = "POST"
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpBody = try! JSONSerialization.data(withJSONObject: model.parameters)

		Alamofire.request(request)
			.responseJSON { response in
				switch response.result {
				case .success(let value):completionHandler(value as? NSDictionary, nil)
				case .failure(let error):completionHandler(nil, error)
				}
			}
	}	
}
