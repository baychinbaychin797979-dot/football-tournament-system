# ⚽ Football Demo - API với Dữ liệu Demo Bóng Đá

<div align="center">

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)
![Express](https://img.shields.io/badge/Express-000000?style=for-the-badge&logo=express&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)

**Hệ thống demo hiển thị dữ liệu bóng đá với API REST và giao diện web đẹp mắt**

[Demo](#-truy-cập) • [Tài liệu](#-api-endpoints) • [Đóng góp](CONTRIBUTING.md)

</div>

---

## 🎯 Tổng quan

Dự án này bao gồm:
- **API Server**: Node.js/Express với dữ liệu demo về bóng đá (quốc gia, giải đấu, đội bóng, trận đấu)
- **Frontend**: Giao diện web responsive với HTML/CSS/JavaScript thuần
- **Docker**: Containerize toàn bộ hệ thống, dễ dàng deploy

## 📸 Screenshots

### Giao diện Chính
![Dashboard](https://via.placeholder.com/800x400?text=Football+Demo+Dashboard)

### Danh sách Trận đấu
![Matches](https://via.placeholder.com/800x400?text=Football+Matches)

## 📋 Yêu cầu

- Docker & Docker Compose
- Node.js & npm (optional - nếu muốn dùng npm scripts)

## 🚀 Cách chạy

### Cách 1: Sử dụng npm scripts (khuyến nghị)

```bash
# Khởi động
npm start

# Dừng
npm stop

# Restart
npm restart

# Rebuild toàn bộ
npm run rebuild

# Xem logs
npm run logs

# Xem logs riêng lẻ
npm run logs:api
npm run logs:frontend

# Dọn dẹp hoàn toàn
npm run clean
```

### Cách 2: Sử dụng Docker Compose trực tiếp

#### 1. Khởi động hệ thống

```bash
docker-compose up -d
```

#### 2. Truy cập ứng dụng

- **Giao diện web**: http://localhost:8080
- **API**: http://localhost:3000/api

#### 3. Dừng hệ thống

```bash
docker-compose down
```

#### 4. Xóa hoàn toàn (bao gồm volumes)

```bash
docker-compose down -v
```

## 🎨 Giao diện

Giao diện web hiển thị:
- 📊 **Thống kê tổng quan**: Số lượng quốc gia, giải đấu, đội bóng, trận đấu
- 🏆 **Trận đấu**: Danh sách các trận đấu với thông tin chi tiết
- 👥 **Đội bóng**: Thông tin về các đội bóng
- 🎯 **Giải đấu**: Các giải đấu quốc tế và trong nước
- 🌍 **Quốc gia**: Danh sách các quốc gia tham gia

## 🔌 API Endpoints

### Thống kê
- `GET /api/stats` - Thống kê tổng quan

### Quốc gia
- `GET /api/countries` - Danh sách quốc gia
- `GET /api/countries/:id` - Chi tiết quốc gia

### Giải đấu
- `GET /api/competitions` - Danh sách giải đấu
- `GET /api/competitions/:id` - Chi tiết giải đấu

### Đội bóng
- `GET /api/teams` - Danh sách đội bóng
- `GET /api/teams/:id` - Chi tiết đội bóng
- `GET /api/teams?country_id=1` - Lọc theo quốc gia

### Trận đấu
- `GET /api/matches` - Danh sách trận đấu
- `GET /api/matches/:id` - Chi tiết trận đấu
- `GET /api/matches?status=completed` - Lọc theo trạng thái (completed/scheduled)

## 📁 Cấu trúc dự án

```
.
├── api/                      # API Server
│   ├── Dockerfile
│   ├── package.json
│   └── server.js            # Express server với dữ liệu demo
├── frontend/                # Frontend Web
│   ├── Dockerfile
│   └── index.html          # Single page application
├── docker-compose.yml      # Docker compose configuration
└── README.md
```

## 🔧 Cấu hình

Cấu hình trong [docker-compose.yml](docker-compose.yml):

- API Port: 3000
- Frontend Port: 8080

## 📊 Dữ liệu Demo

Hệ thống bao gồm dữ liệu demo:
- 5 quốc gia (Việt Nam, Thái Lan, Malaysia, Indonesia, Singapore)
- 3 giải đấu (AFF Cup 2024, V.League 1, Thai League 1)
- 6 đội bóng
- 4 trận đấu (2 đã hoàn thành, 2 sắp diễn ra)

## 🛠️ Phát triển

### Chỉnh sửa dữ liệu

Dữ liệu demo nằm trong [api/server.js](api/server.js). Sửa object `data` để thay đổi dữ liệu.

### Rebuild sau khi thay đổi

```powershell
docker-compose down
docker-compose build
docker-compose up -d
```

### Xem logs

```powershell
# Logs của API
docker logs football_api

# Logs của Frontend
docker logs football_frontend

# Follow logs
docker logs -f football_api
```

## 🎉 Tính năng

✅ API REST đầy đủ với dữ liệu demo
✅ Giao diện web responsive, đẹp mắt
✅ Hỗ trợ CORS cho API
✅ Docker containerization
✅ Dữ liệu về bóng đá Việt Nam và Đông Nam Á
✅ Thống kê và filtering
✅ UI/UX hiện đại với gradient và animations

## 📝 License

MIT
git branch -M main
git push -u origin main
```
