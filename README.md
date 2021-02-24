# wasi-sdk-sample

Download wasi-sdk and wasmtime.
```
make download_wasi_sdk
make download_wasmtime
```

## Run WASM outside browser

```
make build_wasm
make test
```

## Run WASM inside browser

```
make build_wasi
make server
# Access http://localhost:8000/src/calc/
```
