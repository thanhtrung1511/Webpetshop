-- ============================================================
--  BỐ CỦA BÔNG — Tạo bảng database trên Supabase
--  Cách dùng: vào Supabase → menu trái "SQL Editor" → New query
--  → dán TOÀN BỘ nội dung file này vào → bấm RUN (▶)
-- ============================================================

-- 1) BẢNG ĐƠN HÀNG ------------------------------------------
create table if not exists public.orders (
  id            bigint generated always as identity primary key,
  code          text,
  customer_name text,
  phone         text,
  address       text,
  payment       text,
  items         jsonb,
  total         bigint,
  note          text,
  status        text default 'pending',
  created_at    timestamptz default now()
);

-- 2) BẢNG LỊCH HẸN ------------------------------------------
create table if not exists public.bookings (
  id            bigint generated always as identity primary key,
  code          text,
  customer_name text,
  phone         text,
  pet_name      text,
  pet_type      text,
  service       text,
  date          text,
  time          text,
  note          text,
  status        text default 'pending',
  created_at    timestamptz default now()
);

-- 3) BẬT BẢO MẬT (RLS) và CHO PHÉP TRUY CẬP -----------------
-- Lưu ý: đây là cấu hình ĐƠN GIẢN cho bài tập/demo: cho phép
-- khách (anon) tạo đơn/lịch và đọc dữ liệu. Với web thật chạy
-- kinh doanh nên siết chặt hơn (chỉ admin mới đọc được).
alter table public.orders   enable row level security;
alter table public.bookings enable row level security;

drop policy if exists "public access orders"   on public.orders;
drop policy if exists "public access bookings" on public.bookings;

create policy "public access orders"
  on public.orders   for all
  using (true) with check (true);

create policy "public access bookings"
  on public.bookings for all
  using (true) with check (true);

-- XONG! Quay lại web, đặt thử 1 đơn hàng và 1 lịch hẹn,
-- rồi vào Supabase → Table Editor để xem dữ liệu đã lưu.
