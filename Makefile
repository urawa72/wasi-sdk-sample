WASI_SDK_PATH = $(abspath $(PWD)/wasi-sdk)
WASMTIME_PATH = $(abspath $(PWD)/wasmtime)
WASM_NAME = build/sample.wasm
SYS_ROOT = $(WASI_SDK_PATH)/share/wasi-sysroot
CC = $(WASI_SDK_PATH)/bin/clang++ --sysroot=$(SYS_ROOT)

download_wasi_sdk:
	wget https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-12/wasi-sdk-12.0-macos.tar.gz -O wasi-sdk.tar.gz
	mkdir -p wasi-sdk && tar xvf wasi-sdk.tar.gz -C wasi-sdk --strip-components 1
	rm -rf wasi-sdk.tar.gz

download_wasmtime:
	wget https://github.com/bytecodealliance/wasmtime/releases/download/v0.23.0/wasmtime-v0.23.0-x86_64-macos.tar.xz -O wasmtime.tar.gz
	mkdir -p wasmtime && tar xvf wasmtime.tar.gz -C wasmtime --strip-components 1
	rm -rf wasmtime.tar.gz

build:
	@mkdir -p build
	$(CC) src/main.cpp -o $(WASM_NAME)

test:
	@$(WASMTIME_PATH)/wasmtime $(WASM_NAME)

clean:
	rm -rf build/

.PHONY: download_wasi_sdk download_wasmtime build test clean
