# คู่มือการติดตั้ง College of Computing Shop

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
    ├── assets # Store images, logo etc.
    ├── dev-docs
    │   └── ... # Stored Document file such as Sprint Backlog, UAT, ADAPT Blueprint about each sprint.
    ├── tests
    │   └── playwright # A testing folder with Playwright (Browser Automated Test)
    │       └── ... # Stored Testing files
    ├── .gitignore
    ├── docker-compose.yml
    ├── Dockerfile
    └── README.md
```

**Step 3** : ทำการพิมพ์คำสั่งดังนี้ใน Terminal เพื่อทำการสร้าง Container ด้วย docker-compose.yml

```bash
# .../cp-shop
docker compose up
```

หลังจากที่ใช้คำสั่งดังกล่าวแล้ว ในไดเรกทอรี่ /cp-shop จะมีโฟลเดอร์ไฟล์ดังนี้

```bash
...
└── cp-shop
    ├── .git
    ├── app
    │   ├── backups # Stored backup files of store
    │   ├── img # Stored all images
    │   ├── modules
    │   │   └── testModule
    │   │       └── ... # Stored Development Modules for Prestashop
    │   └── themes
    │       └── myTheme
    │           └── ... # Stored Development Themes for Prestashop
    ├── assets
    ├── dev-docs
    │   └── ... # Stored Document file such as Sprint Backlog, UAT, ADAPT Blueprint about each sprint.
    ├── tests
    │   └── playwright
    │       └── ...
    ├── .gitignore
    ├── docker-compose.yml
    ├── Dockerfile
    └── README.md
```

**Step 4** : ทำการเปิด Browser ไปที่ <http://localhost:8080/installation>

. . .
