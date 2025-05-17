# Ratel Auth Project

An example authentication service built with the [Ratel framework](https://ratel-dart.github.io/Documentation/).

## 🔗 Ratel Framework

Learn more about Ratel and its features on the official repo:

> [https://github.com/Ratel-Dart/Ratel](https://github.com/Ratel-Dart/Ratel)

---

## 📁 Project Structure

```text
.
├── config
│   └── di.dart
├── internal
│   ├── application
│   │   └── DTOs
│   │       └── auth_dto.dart
│   ├── database
│   │   └── models
│   │       └── auth.dart
│   ├── repositories
│   │   ├── auth_repository.dart
│   │   └── auth_repository_impl.dart
│   ├── handlers
│   │   └── auth_handler.dart
│   └── shared
│       └── utils.dart
├── .env
├── .gitignore
├── Dockerfile
├── main.dart
├── pubspec.lock
└── pubspec.yaml
```

---

## ⚙️ Prerequisites

* **Dart SDK** 
* A `.env` file in the project root with any required environment variables (e.g. database URL, JWT secret)

---

## 🚀 Getting Started

1. **Clone the repository**

   ```bash
   git clone https://github.com/DanielBrisch/Auth-Ratel.git
   cd Auth-Ratel
   ```

2. **Install dependencies**

   ```bash
   dart pub get
   ```

3. **Configure environment**
   Create a file named `.env` in the project root and add your variables, for example:

   ```dotenv
   DATABASE_URL="postgres://user:pass@localhost:5432/mydb"
   JWT_SECRET="your_jwt_secret"
   ```

4. **Run the application**

   ```bash
   dart main.dart
   ```

---

## 🐳 Docker

Build and run with Docker:

```bash
docker build -t ratel-auth .
docker run --env-file .env -d -p 8080:8080 ratel-auth
```

---

