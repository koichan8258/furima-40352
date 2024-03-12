const pay = () => {
  const payjp = Payjp('pk_test_8708ddec5845cc671c117747')
  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    console.log("フォーム送信時にイベント発火")
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);