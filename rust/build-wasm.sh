#!/bin/sh
# Copyright (c) godot-rust; Bromeon and contributors.
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# Must be in dodge-the-creep's rust directory in order to pick up the .cargo/config
cd "$(dirname "$0")" || exit

export CARGO_TARGET_DIR=../godot/plugin/rust

# We build the host gdextension first so that the godot editor doesn't complain.
cargo build --package dodge-the-creeps &&
cargo build --package dodge-the-creeps --target wasm32-unknown-emscripten -Zbuild-std $@
