FROM debian:trixie-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    nodejs \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L -o jbr.tar.gz https://cache-redirector.jetbrains.com/intellij-jbr/jbr_ft-21.0.9-linux-x64-b1038.76.tar.gz \
    && mkdir -p /opt/jbr \
    && tar -xzf jbr.tar.gz -C /opt/jbr --strip-components=1 \
    && rm jbr.tar.gz
ENV JAVA_HOME=/opt/jbr

RUN curl -L -o android-cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip \
    && mkdir -p /tmp/android/sdk \
    && unzip -q android-cmdline-tools.zip -d /tmp/android/sdk \
    && rm android-cmdline-tools.zip \
    && mkdir -p /opt/android/sdk/cmdline-tools \
    && mv /tmp/android/sdk/cmdline-tools /opt/android/sdk/cmdline-tools/latest
ENV ANDROID_SDK_ROOT=/opt/android/sdk

RUN yes | /opt/android/sdk/cmdline-tools/latest/bin/sdkmanager --licenses

RUN /opt/android/sdk/cmdline-tools/latest/bin/sdkmanager --install "platforms;android-36" "platform-tools" "ndk;29.0.14206865" "build-tools;36.0.0"
ENV ANDROID_HOME="/opt/android/sdk"
ENV NDK_HOME="$ANDROID_HOME/ndk/29.0.14206865"

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup target add aarch64-linux-android armv7-linux-androideabi i686-linux-android x86_64-linux-android

RUN curl -fsSL https://get.pnpm.io/install.sh | ENV="$HOME/.bashrc" SHELL="$(which bash)" bash -

WORKDIR /opt/app
