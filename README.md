# EcoDelivery — Mobile App (Flutter)

Mobile client for **EcoDelivery S.A.S.**, an eco-friendly delivery startup (bicycles and electric motorcycles) operating in five zones of the city (Norte, Sur, Centro, Occidente, Chapinero). This app lets clients create orders and lets couriers update their delivery status in real time, consuming the REST API built for this project.

This module is part of a larger technical assessment that also includes a NestJS backend, an Airflow ETL pipeline and an operations dashboard. This README only covers the **Flutter app**. The backend/Airflow/dashboard repository ships its own README.

## Context / assumptions

- The API model exposes `estado` values `pendiente | en_camino | entregado | cancelado`, `zona` values `norte | sur | centro | occidente | chapinero` and `metodo_pago` values `efectivo | tarjeta | app` — the app's domain enums mirror these exactly.
- The backend requires a Bearer JWT on every request except `/`, `/auth/register` and `/auth/login`, and enforces roles: creating an order requires role `cliente`, advancing an order's status requires role `repartidor`. The app hides the "create order" and "advance status" actions when the logged-in user's role doesn't match, to avoid guaranteed `403` responses.
- The optional/non-blocking extras from the assignment that **are** implemented: a login/register screen and pull-to-refresh on the orders list.
- Nothing required by the assignment was left incomplete on the Flutter side. One backend limitation worth noting: the `repartidor` field on an order is never assigned by any endpoint, so it always shows as "unassigned" in the order detail — this is a backend gap, not something fixable from the app.

## Tech stack

- **Flutter** (Dart SDK `^3.11.5`)
- **State management / DI:** `flutter_riverpod` + `riverpod_generator` (code-gen, `@riverpod` annotations)
- **Domain/data models:** `freezed` + `json_serializable`
- **HTTP client:** `dio`
- **Session persistence:** `flutter_secure_storage` (JWT stored in the platform keychain/keystore)
- **Typography:** `google_fonts` (Poppins for headings, Inter for body text)

## Architecture

Feature-based DDD (vertical slicing), mirroring the backend's approach:

```
lib/
  core/                       # cross-cutting concerns (no business logic)
    config/                   # env config (API base URL)
    network/                  # Dio client, auth token holder
    theme/                    # colors, ThemeData
  features/
    auth/
      domain/                 # entities, exceptions, repository interface
      application/            # Riverpod controllers (AsyncNotifier)
      infrastructure/         # Dio data source, secure storage, repository impl
      presentation/           # screens, widgets, UI mappers
    pedidos/
      domain/
      application/
      infrastructure/
      presentation/
```

The `domain/` layer has no dependency on Flutter or Dio. `infrastructure/` is the only layer that talks to the network and does JSON/enum mapping. `presentation/` only depends on `application/` (Riverpod providers) and `domain/` (entities), never directly on `infrastructure/`.

## Prerequisites

- Flutter SDK (stable channel) compatible with Dart `^3.11.5`. Check with:
  ```bash
  flutter --version
  ```
- The backend API running and reachable (see [Backend URL / environment configuration](#backend-url--environment-configuration) below). The backend must have **CORS enabled** if you plan to run the app on Chrome/web (`app.enableCors()` in the NestJS `main.ts`).
- For Android emulator/device builds: Android SDK + a configured emulator or a physical device with USB debugging.
- For Linux desktop builds: a working `ld`/`ld.lld` linker installed (`sudo apt install lld` if `flutter run -d linux` fails with a linker error).

## Install dependencies

From the repository root:

```bash
flutter pub get
```

## Generate code (Freezed / Riverpod / json_serializable)

This project relies on generated code (`.freezed.dart`, `.g.dart`) for entities, providers and DTOs. Run this after cloning and after any change to an annotated class:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Backend URL / environment configuration

The API base URL is **not hardcoded** — it's injected at build/run time via `--dart-define`, read in `lib/core/config/env_config.dart`:

```dart
static const apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://localhost:3000',
);
```

Pass the right value depending on where the backend is reachable from:

| Target | `API_BASE_URL` value | Why |
|---|---|---|
| Chrome / web | `http://localhost:3000` (default, no flag needed) | Browser runs on the same machine as the backend |
| Linux desktop | `http://localhost:3000` (default, no flag needed) | Same machine |
| Android emulator | `http://10.0.2.2:3000` | The emulator's virtual network maps the host machine to `10.0.2.2`, not `localhost` |
| Physical device (USB/WiFi) | `http://<your-machine-LAN-IP>:3000` | The device is a separate host on the network; `localhost` would point to the device itself |

Example:

```bash
flutter run -d chrome --dart-define=API_BASE_URL=http://localhost:3000
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:3000   # Android emulator
```

## Running the app

```bash
flutter devices          # list available targets
flutter run               # pick a target interactively
```

or target a specific device directly, e.g.:

```bash
flutter run -d chrome --dart-define=API_BASE_URL=http://localhost:3000
```

### Building

```bash
flutter build apk --debug --dart-define=API_BASE_URL=http://10.0.2.2:3000
flutter build web --dart-define=API_BASE_URL=http://localhost:3000
```

## Test credentials

Seeded by the backend's `prisma/seed.ts` (run `pnpm prisma db seed` on the backend if you haven't):

| Role | Email | Password |
|---|---|---|
| Cliente | `cliente@ecodelivery.com` | `password123` |
| Repartidor | `repartidor@ecodelivery.com` | `password123` |

Log in with **cliente** to create orders, and with **repartidor** to advance an order's status — the UI only shows the action matching the current role.

## Running tests

```bash
flutter analyze
flutter test
```

Widget tests override `authRepositoryProvider` / `orderRepositoryProvider` with fakes, so they run fully offline (no real network calls, no platform secure-storage channel needed).

## Known limitations

- After a successful registration, the app returns to the login screen instead of logging the user in automatically — this was a deliberate simplification, not a bug.
- There is no screen to assign a courier (`repartidor`) to an order, because the backend doesn't expose an endpoint for it.
