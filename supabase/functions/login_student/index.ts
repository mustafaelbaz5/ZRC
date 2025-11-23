import { serve } from "https://deno.land/std@0.203.0/http/server.ts";
import * as bcrypt from "https://deno.land/x/bcrypt@0.4.1/mod.ts";
import { createClient } from "npm:@supabase/supabase-js";
import { create } from "https://deno.land/x/djwt/mod.ts";

const GENERIC_ERROR_MSG = "Invalid email or password";
const headers = {
  "Content-Type": "application/json",
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization",
};

serve(async (req) => {
  try {
    if (req.method === "OPTIONS") {
      return new Response(null, { headers });
    }

    const { email, password } = await req.json();

    // Input validation
    if (!email || !password) {
      return new Response(JSON.stringify({ error: GENERIC_ERROR_MSG }), { status: 400, headers });
    }

    if (password.length < 8 || password.length > 128) {
      return new Response(JSON.stringify({ error: GENERIC_ERROR_MSG }), { status: 400, headers });
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      return new Response(JSON.stringify({ error: GENERIC_ERROR_MSG }), { status: 400, headers });
    }

    // Supabase client
    const supabase = createClient(Deno.env.get("SUPABASE_URL")!, Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!);

    // Get user by email
    const { data, error } = await supabase
      .from("students")
      .select("id, student_code, role, password_hash")
      .eq("email", email)
      .maybeSingle();

    if (error) {
      console.error("Database error:", error);
      return new Response(JSON.stringify({ error: GENERIC_ERROR_MSG }), { status: 500, headers });
    }

    if (!data) {
      return new Response(JSON.stringify({ error: GENERIC_ERROR_MSG }), { status: 401, headers });
    }

    // Check password
    const match = await bcrypt.compare(password, data.password_hash);
    if (!match) {
      // Optional: log failed attempt
      await supabase.from("login_attempts").insert({
        email,
        success: false,
        ip: req.headers.get("x-forwarded-for") ?? "unknown",
        timestamp: new Date().toISOString(),
      });

      return new Response(JSON.stringify({ error: GENERIC_ERROR_MSG }), { status: 401, headers });
    }

    // Optional: log successful login
    await supabase.from("login_attempts").insert({
      email,
      success: true,
      ip: req.headers.get("x-forwarded-for") ?? "unknown",
      timestamp: new Date().toISOString(),
    });

    // Generate JWT
    const jwtSecret = Deno.env.get("JWT_SECRET")!;
    const payload = { user_id: data.id, student_code: data.student_code, role: data.role };
    const token = await create({ alg: "HS256", typ: "JWT" }, payload, jwtSecret);

    return new Response(JSON.stringify({ success: true, token, role: data.role }), { status: 200, headers });
  } catch (err) {
    console.error("Internal login error:", err);
    return new Response(JSON.stringify({ error: GENERIC_ERROR_MSG }), { status: 500, headers });
  }
});
