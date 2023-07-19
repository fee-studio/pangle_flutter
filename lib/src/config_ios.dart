/*
 * Copyright (c) 2021 nullptrX
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import 'config.dart';
import 'constant.dart';
import 'model.dart';

class IOSConfig implements Config {
  final String appId;
  final PangleLogLevel? logLevel;
  final String? idfa;

  /// Register the ad config for iOS
  ///
  /// [appId] the unique identifier of the App
  /// [logLevel] optional. default none
  const IOSConfig({
    required this.appId,
    this.logLevel,
    this.idfa,
  });

  /// Convert config to json
  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'appId': appId,
      'logLevel': logLevel?.index,
      'idfa': idfa,
    };
  }
}

class IOSSplashConfig implements Config {
  final String slotId;
  final double? tolerateTimeout;
  final bool? hideSkipButton;
  final PangleExpressSize? expressSize;

  /// The splash ad config for iOS
  ///
  /// [slotId] The unique identifier of splash ad.
  /// [tolerateTimeout] optional. Maximum allowable load timeout, default 3s, unit s.
  /// [hideSkipButton] optional. Whether hide skip button, default NO.
  ///    If you hide the skip button, you need to customize the countdown.
  ///  [expressSize] optional, 配置广告宽高，默认全屏
  const IOSSplashConfig({
    required this.slotId,
    this.tolerateTimeout,
    this.hideSkipButton,
    this.expressSize,
  });

  /// Convert config to json
  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'slotId': slotId,
      'tolerateTimeout': tolerateTimeout,
      'hideSkipButton': hideSkipButton,
      'expressSize': expressSize?.toJson(),
    };
  }
}

class IOSRewardedVideoConfig implements Config {
  final String slotId;
  final String? userId;
  final String? rewardName;
  final int? rewardAmount;
  final String? extra;
  final PangleLoadingType loadingType;

  /// The rewarded video ad config for Android
  ///
  /// [slotId] The unique identifier of rewarded video ad.
  /// [userId] required.
  //   Third-party game user_id identity.
  //   Mainly used in the reward issuance, it is the callback pass-through parameter from server-to-server.
  //   It is the unique identifier of each user.
  //   In the non-server callback mode, it will also be pass-through when the video is finished playing.
  //   Only the string can be passed in this case, not nil.
  /// [rewardName] optional. reward name.
  /// [rewardAmount] optional. number of rewards.
  /// [extra] optional. serialized string.
  /// [loadingType] optional. 加载广告的类型，默认[PangleLoadingType.normal]
  const IOSRewardedVideoConfig({
    required this.slotId,
    this.userId,
    this.rewardName,
    this.rewardAmount,
    this.extra,
    this.loadingType = PangleLoadingType.normal,
  });

  /// Convert config to json
  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'slotId': slotId,
      'userId': userId,
      'rewardName': rewardName,
      'rewardAmount': rewardAmount,
      'extra': extra,
      'loadingType': loadingType.index,
    };
  }
}

class IOSBannerConfig implements Config {
  final String slotId;
  final PangleExpressSize expressSize;
  final int? interval;

  /// The feed ad config for iOS
  ///
  /// [slotId] required. The unique identifier of a banner ad.
  /// [expressSize] optional. 模板宽高
  /// [interval] The carousel interval, in seconds, is set in the range of 30~120s,
  ///   and is passed during initialization. If it does not meet the requirements,
  ///   it will not be in carousel ad.
  const IOSBannerConfig({
    required this.slotId,
    required this.expressSize,
    this.interval,
  });

  /// Convert config to json
  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'slotId': slotId,
      'expressSize': expressSize.toJson(),
      'interval': interval,
    };
  }
}

class IOSFeedConfig implements Config {
  final String slotId;
  final int? count;
  final PangleExpressSize expressSize;

  /// The feed ad config for iOS
  ///
  /// [slotId] required. The unique identifier of a feed ad.
  /// [count] It is recommended to request no more than 3 ads. The maximum is 10. default 3
  /// [expressSize] optional. 模板宽高.
  const IOSFeedConfig({
    required this.slotId,
    required this.expressSize,
    this.count,
  });

  /// Convert config to json
  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'slotId': slotId,
      'count': count,
      'expressSize': expressSize.toJson(),
    };
  }
}

class IOSInterstitialConfig implements Config {
  final String slotId;
  final PangleExpressSize expressSize;

  /// The interstitial ad config for iOS
  ///
  /// [slotId] required. The unique identifier of a interstitial ad.
  /// [expressSize] optional. 模板宽高.
  const IOSInterstitialConfig({
    required this.slotId,
    required this.expressSize,
  });

  /// Convert config to json
  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'slotId': slotId,
      'expressSize': expressSize.toJson(),
    };
  }
}

class IOSFullscreenVideoConfig implements Config {
  final String slotId;
  final PangleLoadingType loadingType;

  /// The full screen video ad config for iOS
  ///
  /// [slotId] required. The unique identifier of a full screen video ad.
  /// [loadingType] optional. 加载广告的类型，默认[PangleLoadingType.normal]
  const IOSFullscreenVideoConfig({
    required this.slotId,
    this.loadingType = PangleLoadingType.normal,
  });

  /// Convert config to json
  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'slotId': slotId,
      'loadingType': loadingType.index,
    };
  }
}
