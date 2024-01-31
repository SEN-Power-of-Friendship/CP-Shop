# คู่มือการใช้งาน College of Computing Shop

---

## วิธีการติดตั้ง

**Step 1** : ทำการสร้างไดเรกทอรี่เพื่อรองรับโปรเจคที่จะโคลนลง Local Repository

```bash
...
└── cp-shop
```

**Step 2** : ทำการโคลน Git Repository ลงในไดเรกทอรี่ที่สร้าง จากนั้นเปิด Terminal และพิมพ์คำสั่งดังนี้

```bash
# .../cp-shop
git clone https://github.com/SEN-Power-of-Friendship/CP-Shop.git
```

หลังจากที่โคลนแล้ว ในไดเรกทอรี่ /cp-shop จะมีโฟลเดอร์ไฟล์ดังนี้

```bash
...
└── cp-shop
    ├── .git
    ├── assets
    │    └─ images
    │       ├── cold-glass
    │       │   └── ... # Cold Glass images
    │       ├── logo
    │       │   └── ... # Shop's logo images
    │       ├── shirt
    │       │   └── ... # Shirt images
    │       └── voucher
    │           └── ... # Voucher images
    ├── modules
    │    └─ testModule
    │       └── ... # Development Modules for Prestashop
    ├── tests
    │    └─ playwright # Testing folder with Playwright (Browser Automated Test)
    │       ├── ...
    ├── themes
    │    └─ myTheme
    │       └── ... # Development Themes for Prestashop
    ├── docker-compose.yml
    ├── Dockerfile
    └── README.md
```

**Step 3** : ทำการพิมพ์คำสั่งดังนี้ใน Terminal เพื่อทำการสร้าง Container ด้วย docker-compose.yml

```bash
# .../cp-shop
docker compose up
```

**Step 4** : ทำการเปิด Browser ไปที่ <http://localhost:8080/installation>

. . .