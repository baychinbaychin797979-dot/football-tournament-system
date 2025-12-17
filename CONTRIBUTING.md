# Hướng dẫn Đóng góp

Cảm ơn bạn đã quan tâm đến việc đóng góp cho dự án Football Demo!

## 🚀 Bắt đầu

### 1. Fork và Clone
```bash
git clone https://github.com/your-username/football-demo.git
cd football-demo
```

### 2. Khởi động Development
```bash
docker-compose up -d
```

## 📝 Quy tắc Code

### API (Node.js)
- Sử dụng ES6+ syntax
- Đặt tên biến rõ ràng, dễ hiểu
- Comment cho các logic phức tạp
- Đảm bảo API trả về đúng format JSON

### Frontend
- HTML5 semantic tags
- CSS thuần, không dùng framework
- JavaScript vanilla, không dùng jQuery
- Responsive design cho mobile

## 🔍 Kiểm tra Code

### Test API
```bash
# Test all endpoints
curl http://localhost:3000/api/stats
curl http://localhost:3000/api/countries
curl http://localhost:3000/api/teams
curl http://localhost:3000/api/matches
```

### Check Logs
```bash
npm run logs:api
npm run logs:frontend
```

## 📦 Thêm Dữ liệu Mới

Dữ liệu demo nằm trong `api/server.js`:

```javascript
const data = {
  countries: [...],
  competitions: [...],
  teams: [...],
  matches: [...]
};
```

Sau khi chỉnh sửa:
```bash
npm run rebuild
```

## 🎯 Đề xuất Tính năng

Mở issue mới với:
- Mô tả tính năng
- Use case
- Screenshots (nếu có)

## 🐛 Báo lỗi

Mở issue với:
- Mô tả lỗi
- Các bước tái hiện
- Screenshots/logs
- Môi trường (OS, Docker version)

## ✅ Pull Request

1. Tạo branch mới
   ```bash
   git checkout -b feature/ten-tinh-nang
   ```

2. Commit changes
   ```bash
   git commit -m "Add: Thêm tính năng xyz"
   ```

3. Push và tạo PR
   ```bash
   git push origin feature/ten-tinh-nang
   ```

## 💡 Ý tưởng Đóng góp

- Thêm dữ liệu giải đấu mới
- Cải thiện UI/UX
- Thêm filtering nâng cao
- Thêm search functionality
- Dark mode
- Export data (JSON, CSV)
- Authentication
- Admin panel

## 📞 Liên hệ

Có câu hỏi? Mở issue hoặc discussion trên GitHub!
