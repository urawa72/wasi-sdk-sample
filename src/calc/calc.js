(async () => {
  const response = await fetch("/build/calc.wasm");
  const bytes = await response.arrayBuffer();
  const { instance } = await WebAssembly.instantiate(bytes);
  document.getElementById("wasm-button").addEventListener("click", () => {
    console.log("Call calc():", instance.exports.calc(Math.random()));
  });
})();
