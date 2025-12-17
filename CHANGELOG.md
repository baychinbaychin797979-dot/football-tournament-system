# Changelog

## [1.0.0] - 2024-12-17

### ✨ Thêm mới
- API Server với Node.js/Express
- Dữ liệu demo về bóng đá Việt Nam và Đông Nam Á
- Frontend web responsive với HTML/CSS/JavaScript
- Docker containerization cho API và Frontend
- RESTful API endpoints đầy đủ (countries, competitions, teams, matches)
- Giao diện hiện đại với gradient và animations
- Thống kê tổng quan
- Filtering và search capabilities
- npm scripts để quản lý dễ dàng

### 🗑️ Xóa bỏ
- WordPress installation và tất cả dependencies
- MySQL database
- PHPMyAdmin
- Sage theme và Acorn framework
- wp-cli container
- Tất cả PHP dependencies
- seed_data.sql
- .env files (không còn cần thiết)
- Các scripts setup cũ

### 📁 Cấu trúc mới
```
.
├── api/                    # Node.js API Server
│   ├── Dockerfile
│   ├── .dockerignore
│   ├── package.json
│   └── server.js
├── frontend/              # Web Frontend
│   ├── Dockerfile
│   ├── .dockerignore
│   └── index.html
├── docker-compose.yml    # Docker services
├── package.json          # Root package với npm scripts
├── README.md            # Hướng dẫn đầy đủ
├── QUICKSTART.md        # Hướng dẫn nhanh
├── LICENSE              # MIT License
└── .gitignore           # Git ignore rules
```

### 🎯 API Endpoints
- `GET /api/stats` - Thống kê
- `GET /api/countries` - Quốc gia
- `GET /api/competitions` - Giải đấu
- `GET /api/teams` - Đội bóng
- `GET /api/matches` - Trận đấu

### 🌐 URLs
- Frontend: http://localhost:8080
- API: http://localhost:3000/api
