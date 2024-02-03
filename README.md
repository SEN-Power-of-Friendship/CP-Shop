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
    │   └── images
    │       ├── cold-glass
    │       │   └── ... # Stored Cold Glass images
    │       ├── logo
    │       │   └── ... # Stored Shop's logo images
    │       ├── shirt
    │       │   └── ... # Stored Shirt images
    │       └── voucher
    │           └── ... # Stored Voucher images
    ├── backus # Stored backup files of store
    ├── dev-docs
    │   └── ... # Stored Document file such as Sprint Backlog, UAT, ADAPT Blueprint about each sprint.
    ├── modules
    │   └── testModule
    │       └── ... # Stored Development Modules for Prestashop
    ├── tests
    │   └── playwright # A testing folder with Playwright (Browser Automated Test)
    │       └── ... # Stored Testing files
    ├── themes
    │   └── myTheme
    │       └── ... # Stored Development Themes for Prestashop
    ├── .gitignore # Ignore file or directory to push to GitHub
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
