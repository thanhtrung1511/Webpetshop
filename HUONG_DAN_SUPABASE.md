# 🗄️ Hướng dẫn kết nối Database thật (Supabase) — Bố của Bông

Web đã có sẵn đầy đủ chức năng mua hàng, tìm kiếm, đặt lịch.
Làm theo các bước dưới đây để **lưu đơn hàng & lịch hẹn vào database thật**
(miễn phí, không cần thẻ tín dụng). Mất khoảng **10 phút**.

> 💡 Nếu chưa làm bước này, web **vẫn chạy bình thường** và lưu tạm dữ liệu
> trong trình duyệt để demo. Khi nào rảnh thì kết nối Supabase để dữ liệu
> được lưu thật và xem được từ mọi máy.

---

## Bước 1 — Tạo tài khoản Supabase
1. Vào **https://supabase.com** → bấm **Start your project**.
2. Đăng nhập bằng tài khoản **GitHub** (hoặc email).

## Bước 2 — Tạo Project mới
1. Bấm **New project**.
2. Đặt tên: `bo-cua-bong` (tên gì cũng được).
3. Mục **Database Password**: gõ một mật khẩu bất kỳ (lưu lại phòng khi cần).
4. **Region**: chọn **Southeast Asia (Singapore)** cho nhanh.
5. Bấm **Create new project** → đợi ~2 phút cho Supabase khởi tạo.

## Bước 3 — Tạo các bảng dữ liệu
1. Menu bên trái, bấm biểu tượng **SQL Editor**.
2. Bấm **New query**.
3. Mở file **`supabase_setup.sql`** (nằm cùng thư mục), **copy toàn bộ** nội dung.
4. **Dán** vào ô SQL Editor → bấm nút **RUN** (▶) ở góc dưới bên phải.
5. Thấy dòng **"Success. No rows returned"** là đã tạo bảng xong. ✅

## Bước 4 — Lấy URL và KEY
1. Menu trái → bấm **Project Settings** (biểu tượng bánh răng ⚙️).
2. Vào mục **API**.
3. Bố sẽ thấy 2 thông tin cần copy:
   - **Project URL** — dạng `https://abcdxyz.supabase.co`
   - **API Keys → `anon` `public`** — một chuỗi dài bắt đầu bằng `eyJ...`

   > ⚠️ Chỉ dùng key **anon public**. KHÔNG dùng key `service_role` (key bí mật).

## Bước 5 — Dán URL và KEY vào web
Mở **2 file** sau bằng trình soạn thảo (TextEdit, VS Code...):

### 📄 File `index.html`
Tìm đoạn ở gần cuối file (dùng Cmd+F gõ `SUPABASE_URL`):
```js
const SUPABASE_URL = ""; // ví dụ: https://abcdxyz.supabase.co
const SUPABASE_KEY = ""; // ví dụ: eyJhbGciOiJIUzI1NiIsInR5cCI6...
```
Dán vào giữa 2 dấu ngoặc kép:
```js
const SUPABASE_URL = "https://abcdxyz.supabase.co";
const SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6...";
```

### 📄 File `admin.html`
Tìm đoạn tương tự và dán **đúng 2 giá trị giống hệt** vào.

Lưu cả 2 file lại (Cmd+S).

## Bước 6 — Kiểm tra
1. Mở `index.html`, đặt thử **1 đơn hàng** và **1 lịch hẹn**.
2. Mở `admin.html` (mật khẩu mặc định: **`bocuabong`**) → sẽ thấy đơn & lịch vừa tạo.
3. Vào lại Supabase → **Table Editor** → bảng `orders` / `bookings` → thấy dữ liệu là **thành công**! 🎉

---

## ❓ Câu hỏi thường gặp

**Web báo "Lỗi lưu đơn..." khi đặt hàng?**
→ Kiểm tra lại đã dán đúng URL/KEY chưa, và đã chạy file SQL ở Bước 3 chưa.

**Đổi mật khẩu trang admin?**
→ Mở `admin.html`, tìm dòng `const ADMIN_PASSWORD = "bocuabong";` đổi thành mật khẩu khác.

**Muốn web có địa chỉ thật trên internet?**
→ Đẩy code lên GitHub (đã có sẵn repo), vào **Settings → Pages → Deploy from branch → main** →
   sau ~1 phút sẽ có link dạng `https://thanhtrung1511.github.io/Webpetshop/`.

**Dữ liệu lưu ở đâu khi CHƯA kết nối Supabase?**
→ Lưu tạm trong trình duyệt (localStorage). Chỉ thấy trên đúng máy + trình duyệt đó.
   Kết nối Supabase xong thì dữ liệu mới được lưu thật trên cloud.
