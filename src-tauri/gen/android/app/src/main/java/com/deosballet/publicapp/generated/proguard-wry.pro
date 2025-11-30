# THIS FILE IS AUTO-GENERATED. DO NOT MODIFY!!

# Copyright 2020-2023 Tauri Programme within The Commons Conservancy
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: MIT

-keep class com.deosballet.publicapp.* {
  native <methods>;
}

-keep class com.deosballet.publicapp.WryActivity {
  public <init>(...);

  void setWebView(com.deosballet.publicapp.RustWebView);
  java.lang.Class getAppClass(...);
  java.lang.String getVersion();
}

-keep class com.deosballet.publicapp.Ipc {
  public <init>(...);

  @android.webkit.JavascriptInterface public <methods>;
}

-keep class com.deosballet.publicapp.RustWebView {
  public <init>(...);

  void loadUrlMainThread(...);
  void loadHTMLMainThread(...);
  void evalScript(...);
}

-keep class com.deosballet.publicapp.RustWebChromeClient,com.deosballet.publicapp.RustWebViewClient {
  public <init>(...);
}
