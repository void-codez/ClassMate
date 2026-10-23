-- Run once in Supabase > SQL Editor
create table public.events (
  id bigint generated always as identity primary key,
  event_type text not null check (event_type in ('visit','signup_started','signup_attempt','login_attempt')),
  created_at timestamptz not null default now()
);
alter table public.events enable row level security;
grant insert on public.events to anon;
create policy "anon can insert events" on public.events for insert to anon with check (true);

-- See your numbers (run in the SQL Editor any time):
-- select event_type, count(*) from public.events group by event_type;
-- select date_trunc('day', created_at) d, event_type, count(*) from public.events group by 1,2 order by 1 desc;
