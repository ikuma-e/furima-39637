window.addEventListener('load', () => {
  // 入力された金額の変数を定義
  const priceInput = document.getElementById('item-price');  
    priceInput.addEventListener("input", () => {
      // item-priceに入力した金額を取得
      const inputValue = priceInput.value;
      // 販売手数料の変数を定義
      const addTaxDom = document.getElementById('add-tax-price')
      // 販売手数料のinnerHTML
      addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
      // 販売利益の変数を定義
      const addProfitDom = document.getElementById('profit')
      // 販売利益のinnerHTML
      addProfitDom.innerHTML = inputValue - addTaxDom.innerHTML
    })
})