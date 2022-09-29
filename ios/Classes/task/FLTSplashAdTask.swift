//
//  FLTSplashAdTask.swift
//  pangle_flutter
//
//  Created by nullptrX on 2020/8/16.
//

import BUAdSDK

internal final class FLTSplashAdTask: FLTTaskProtocol {
    private var manager: BUSplashAd
    private var delegate: BUSplashAdDelegate?

    internal init(_ manager: BUSplashAd) {
        self.manager = manager
    }

    convenience init(_ args: [String: Any?]) {
        let slotId: String = args["slotId"] as! String
        let tolerateTimeout: Double? = args["tolerateTimeout"] as? Double
        let hideSkipButton: Bool? = args["hideSkipButton"] as? Bool
        let frame = UIScreen.main.bounds
        // BUSplashAdView(slotID: slotId, frame: frame)
        let slot = BUAdSlot.init()
        slot.id = slotId
        let splashAd = BUSplashAd.init(slot: slot, adSize: frame.size)
        if tolerateTimeout != nil {
            splashAd.tolerateTimeout = tolerateTimeout!
        }
        if hideSkipButton != nil {
            splashAd.hideSkipButton = hideSkipButton!
        }
        let vc = AppUtil.getVC()
        vc.view.addSubview(splashAd.splashView!)
        
        self.init(splashAd)
    }

    func execute() -> (@escaping (FLTTaskProtocol, Any) -> Void) -> Void {
        return { result in
            let delegate = FLTSplashAd(success: { [weak self] msg in
                guard let self = self else { return }
                result(self, ["code": 0, "message": msg])
            }, fail: { [weak self] error in
                guard let self = self else { return }
                let e = error as NSError?
                result(self, ["code": e?.code ?? -1, "message": error?.localizedDescription ?? ""])
            })

            self.manager.delegate = delegate
            self.delegate = delegate

            self.manager.loadData()
        }
    }
}
