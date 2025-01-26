export function redirectUserToInstagram() {
  const redirectUrl = "https://help.instagram.com/";
  const ancore = document.createElement("a");
  ancore.href = redirectUrl;
  ancore.rel = "noopener noreferrer";
  ancore.click();
}
