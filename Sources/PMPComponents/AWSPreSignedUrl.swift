import Foundation

public enum AwsUploaderType: String {
    case image = "image/jpeg"
    case pdf = "application/pdf"
    case video = "video/mp4"
}

public class AWSS3Uploader {
    
    class func upload(_ fileURL: URL, toPresignedURL remoteURL: URL, fileType: AwsUploaderType, completion: @escaping (Result<URL?, Error>) -> Void) {
        
         var request = URLRequest(url:  remoteURL )
         request.cachePolicy = .reloadIgnoringLocalCacheData
         request.httpMethod = "PUT"
        request.addValue(fileType.rawValue, forHTTPHeaderField: "Content-Type")
         let uploadTask = URLSession.shared.uploadTask(with: request, fromFile: fileURL, completionHandler: { (data, response, error) in
             
             if let error = error {
                 completion(.failure(error))
                 return
             }
             guard response != nil, data != nil else {
                 completion(.success(nil))
                 return
             }
             completion(.success(fileURL))
         })
         uploadTask.resume()
     }
}
