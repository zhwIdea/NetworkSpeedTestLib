# NetworkSpeedTestLib
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## NetworkSpeedTestLib is a Network Speed Test Tool. that can measure the download speed and upload speed, and ping url


### Setup Instructions
[Swift Package Manager](https://swift.org/package-manager/)
------------------

When using Xcode 11 or later, you can install `NetworkSpeedTestLib` by going to your Project settings > `Swift Packages` and add the repository by providing the GitHub URL. Alternatively, you can go to `File` > `Swift Packages` > `Add Package Dependencies...`

## Getting Started
### get best service
  
  
    var speedTest = SpeedTest()
    var serverResult:SeverResult?
 
    /// start the speed Test process
    func startSpeedTestProgress() {
        // get the best service
        speedTest.findBestHost(from: 5, timeout: 15) { [weak self] result in
                switch result {
                case .value(let value):
                    print(" get result value = \(value)")
                    // get result value
                    self?.serverResult = value
                    
                    // start upload speed test
                    self?.getUploadSpeedTest()
                    
                case .error:
                    print("Cannot find host!!")
                }
        }
    }
    
    
### Get Upload speed
  
     func getUploadSpeedTest() {
        guard let surfResult = serverResult else { return }

        // Test upload speed
        speedTest.runUploadTest(for: serverResult!.url, size: 10000000, timeout: 10) { speed in
            print("Current average upload speed:\(speed.description)")
        } final: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .value(let speed):
                print("Final average upload speed:\(speed.description)")
            case .error:
                print("An error happened during uploading...")
            }
        }
    }

### Get Download speed
  
      func getDownloadSpeedTest() {
        guard let surfResult = serverResult else { return }

        // Test download speed
        speedTest.runDownloadTest(for: surfResult.url, size: 10000000, timeout: 10) { speed in
                print("Current download speed:\(speed.description)")
            } final: { result in
                switch result {
                case .value(let speed):
                    print("Final download speed:\(speed.description)")
                case .error:
                    print("An error happened during download speed...")
                }
         }
    }



    
