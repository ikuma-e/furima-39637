const pay = () => {
  const publicKey = gon.public_key
  const payjp = Payjp(publicKey)

  const elements = payjp.elements();
  // ＃〇〇というid属性の要素とフォームを置き換える
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');
  // ビューのフォームを取得
  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    // レスポンスを受け取った後の処理を記述
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        // トークンの情報を取得できるよう記述※ユーザーに見せる必要のない情報のためhiddenを指定
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      // データ取得した後、フォームに存在するクレジットカード情報を削除
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      // フォームの情報をサーバーサイドに送信
      document.getElementById("charge-form").submit();
    });
    // フォーム送信処理をキャンセル、サーバーサイドへリクエストは送られない
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);