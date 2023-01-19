/*
 * Copyright (c) 2022 Simform Solutions
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
import 'package:flutter/material.dart';

import '../../chatview.dart';
import '../utils/package_strings.dart';

class ChatUITextField extends StatelessWidget {
  const ChatUITextField({
    Key? key,
    this.sendMessageConfig,
    required this.focusNode,
    required this.textEditingController,
    required this.onSendPressed,
    required this.onCameraPressed,
  }) : super(key: key);
  final SendMessageConfiguration? sendMessageConfig;
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final VoidCallBack onSendPressed;
  final VoidCallBack onCameraPressed;
  final _outLineBorder = InputBorder.none;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 7.0,
              horizontal: 7.0,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F1F1),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: focusNode,
                    controller: textEditingController,
                    style: sendMessageConfig?.textStyle ?? const TextStyle(color: Colors.black),
                    maxLines: 5,
                    minLines: 1,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      // suffixIcon: IconButton(
                      //   color: sendMessageConfig?.defaultSendButtonColor ?? const Color(0xFFA1A1A1),
                      //   onPressed: onPressed,
                      //   icon: sendMessageConfig?.sendButtonIcon ?? const Icon(Icons.camera_alt_outlined),
                      // ),
                      hintText: sendMessageConfig?.hintText ?? PackageStrings.message,
                      // fillColor: sendMessageConfig?.textFieldBackgroundColor ?? Colors.white,
                      // filled: true,
                      hintStyle: sendMessageConfig?.hintStyle ??
                          const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF838383),
                            letterSpacing: 0.25,
                          ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 14,
                      ),
                      border: _outLineBorder,
                      // focusedBorder: _outLineBorder,
                      // enabledBorder: _outLineBorder,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: Color(0xFF838383),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: sendMessageConfig?.defaultSendButtonColor ?? const Color(0xFFe95223),
          ),
          child: IconButton(
            onPressed: onSendPressed,
            icon: const Icon(
              Icons.send_rounded,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
