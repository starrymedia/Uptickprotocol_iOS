import XCTest
import UptickProtocolIRISnet
import Pods_DmaIRIS_SDK_IOS_Tests

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
   
    }
    

    
    func testSignatureString() {

        let privateKey = "1779b474da9ef4aef67271f455dd58054d3181863b91f63910074f3cb9123591"
        let result = "DRu7j3PHuu7/FfIkh/GslYggaOW+V6wtILuarZm2d5xHUSVU8+DYA/X/rqkerC+STSLcOVq6pL53eMjsf3MpmQ=="
        let dataString = "CogBCoUBChwvY29zbW9zLmJhbmsudjFiZXRhMS5Nc2dTZW5kEmUKKmlhYTF4eXdkMGszY2o1bGM4dWd1anB4cDQ1ZWpwdm1oaDMzMDN6dTVwcRIqaWFhMXVmbmplbHdnMjc2cjJ4amo3Y3ZzN2xlNWVzY2E1OXRtdGNsN3ZlGgsKBHViaWYSAzEwMBJjClAKRgofL2Nvc21vcy5jcnlwdG8uc2VjcDI1NmsxLlB1YktleRIjCiEDhtQPSOhQCwNAa+QWzjiXPANa+UDj4EqsKcjt6v0dKLsSBAoCCAEYDRIPCgkKBHViaWYSATEQwJoMGgd0ZXN0aW5nIAg="
        let data = Data(base64Encoded: dataString)?.sha256()
        let sign = WalletManager.signatureString(hashData: data!, privateKey: privateKey)
        print("sign:\(sign!.base64EncodedString())")
        XCTAssert(sign?.base64EncodedString() == result, "Pass")

    }
    
    func testIdentifer() {

        print("============")
        var tokenids = [String]()
        
        for _ in 0..<1000 {
            let iden = TxUtils.identifier
            if tokenids.contains(iden) {
                print("error")
                return
            }
            tokenids.append(iden)
            print(iden)
            print(iden.count)
        }
        print("============")

    }
    
    func testAmount() {
        
        print("============")
        var gasLimint = Decimal(20000)
        var gasPrice = Decimal(2.98)
        
        var gasPriceUp = Decimal()
        NSDecimalRound(&gasPriceUp, &gasPrice, 0, .up)
        print(gasPriceUp)
        
        var amount = Decimal()
        NSDecimalMultiply(&amount, &gasLimint, &gasPriceUp, .plain)
        let amountString = NSDecimalString(&amount, nil)
        print(UInt64(amountString))
        print("============")

    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
