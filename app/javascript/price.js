function price() {
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener('input', () => {
    //要素から、金額の値のみ(value)を取り出す
    const inputValue = priceInput.value;
    //手数料を表示する場所を取得
    const addTaxDom = document.getElementById("add-tax-price");
    //利益を表示する場所を取得
    const profit = document.getElementById("profit")
    //手数料表示欄に、計算した値を挿入(innerHTML)
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    //利益表示欄に、計算した値を挿入
    profit.innerHTML = Math.floor(inputValue - inputValue * 0.1);
  });
}

window.addEventListener('load', price)