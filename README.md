# ClassMate validation page

One page with sign-up and log-in, plus free visitor and sign-up tracking, to test demand before building the full app.

## What gets counted (Supabase `events` table)
`visit`, `signup_started`, `signup_attempt`, `login_attempt`. No names, emails or IPs are stored in events. Bots are skipped.

## Set up (all free)
1. **Supabase**: create a project, open SQL Editor, paste and run `supabase.sql`. Under Authentication, note that free-tier confirmation emails are rate limited; turning off "Confirm email" is fine for a demand test.
2. **GitHub**: push this folder to a new repository.
3. **Vercel**: Add New > Project > import the repo. Add the five variables from `.env.example` (Settings > Environment Variables), then Deploy.
4. **Custom domain** (required, the vercel.app address is only for testing): Vercel > Settings > Domains. Then set `NEXT_PUBLIC_SITE_URL` to that domain and redeploy.
5. **Before sharing**: set `NEXT_PUBLIC_SITE_NAME` and `NEXT_PUBLIC_CONTACT_EMAIL`. The legal pages show this email, so use a real one.

## Reading your results
Supabase > SQL Editor:
`select event_type, count(*) from public.events group by event_type;`
Sign-up rate = `signup_attempt` / `visit`.

## Not done / your call
- Have a lawyer review the four legal pages and choose the governing law before launch. They are sensible drafts, not legal advice.
- The page has no rate limiting. If someone spams it, add Vercel's firewall rules (free).
- Vercel's free Hobby plan is for non-commercial use. Move to a paid plan once ClassMate earns money.
- I couldn't run `npm install` or `next build` in my environment, so run `npm install && npm run build` once and tell me if anything errors.
