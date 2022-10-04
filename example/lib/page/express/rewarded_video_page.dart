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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pangle_flutter/pangle_flutter.dart';

import '../constant.dart';

class RewardedVideoPage extends StatefulWidget {
  const RewardedVideoPage({Key? key}) : super(key: key);

  @override
  _RewardedVideoPageState createState() => _RewardedVideoPageState();
}

class _RewardedVideoPageState extends State<RewardedVideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewarded Video Express AD'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: _onTapLoad,
              child: const Text('Load'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: _onTapShow,
              child: const Text('Show ad'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: _onTapShowAndLoad,
              child: const Text('Show ad and preload'),
            ),
          ),
        ],
      ),
    );
  }

  _onTapLoad() async {
    final result = await pangle.loadRewardedVideoAd(
      iOS: const IOSRewardedVideoConfig(
        slotId: kRewardedVideoExpressId,
        loadingType: PangleLoadingType.preloadOnly,
      ),
      android: const AndroidRewardedVideoConfig(
        slotId: kRewardedVideoExpressId,
        loadingType: PangleLoadingType.preloadOnly,
      ),
      callback: (event) {
        debugPrint('rewarded_video: $event');
      },
    );
    var data = jsonEncode(result);
    debugPrint(data);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(data)),
    );
  }

  _onTapShow() async {
    final result = await pangle.loadRewardedVideoAd(
      iOS: const IOSRewardedVideoConfig(
        slotId: kRewardedVideoExpressId,
        loadingType: PangleLoadingType.normal,
      ),
      android: const AndroidRewardedVideoConfig(
        slotId: kRewardedVideoExpressId,
        loadingType: PangleLoadingType.normal,
      ),
      callback: (event) {
        debugPrint('rewarded_video: $event');
      },
    );
    var data = jsonEncode(result);
    debugPrint(data);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(data)),
    );
  }

  _onTapShowAndLoad() async {
    final result = await pangle.loadRewardedVideoAd(
      iOS: const IOSRewardedVideoConfig(
        slotId: kRewardedVideoExpressId,
        loadingType: PangleLoadingType.preload,
      ),
      android: const AndroidRewardedVideoConfig(
        slotId: kRewardedVideoExpressId,
        loadingType: PangleLoadingType.preload,
      ),
      callback: (event) {
        debugPrint('rewarded_video: $event');
      },
    );
    var data = jsonEncode(result);
    debugPrint(data);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(data)),
    );
  }
}
