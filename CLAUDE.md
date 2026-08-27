# CLAUDE.md — EcoDelivery App (Flutter)

Este archivo define cómo debes trabajar en este repositorio. Léelo completo antes de tocar código.

## Idioma

- Comunícate **siempre en español**: mensajes al usuario, explicaciones, nombres de PRs, comentarios de PR, documentación (README, ADRs).
- El código en sí (nombres de variables, funciones, clases, strings de log técnico) va en **inglés**, siguiendo la convención habitual del proyecto. No mezcles español en identificadores de código.

## Arquitectura

- **DDD por feature (vertical slicing)**, igual que el backend: cada feature vive en su propia carpeta con sus capas internas, nada de carpetas globales por tipo (`/widgets`, `/screens` a nivel raíz).
- Estructura por feature:
  ```
  lib/features/<feature>/
    domain/          → entidades, value objects, interfaces de repositorio
    application/       → providers de Riverpod, casos de uso, notifiers
    infrastructure/     → implementación de repositorios, data sources (API, cache)
    presentation/       → screens, widgets, mappers de UI
  ```
- El dominio no depende de Flutter ni de infraestructura (nada de `Widget`, `Dio`, etc. dentro de `domain/`).
- Antes de crear una feature nueva, revisa cómo están armadas las existentes y sigue el mismo patrón.

## Manejo de estado y generación de código

- **Riverpod** como único manejador de estado — nada de `setState` salvo animaciones puramente locales de UI sin lógica de negocio.
- Usa generación de código con `riverpod_generator` (anotaciones `@riverpod`) en vez de providers escritos a mano.
- Usa **Freezed** para entidades del dominio, modelos de datos y estados (unions selladas para estados de carga/éxito/error).
- Después de crear o modificar clases anotadas, corre `build_runner` para regenerar los `.freezed.dart` / `.g.dart` correspondientes — nunca dejes código que dependa de un archivo generado desactualizado o inexistente.
- No commitees manualmente archivos generados a mano ni los edites directamente.

## Código

- **Cero comentarios en el código.** Si algo necesita explicarse, el nombre de la variable/función/clase está mal elegido o la función hace demasiado — refactoriza.
- Nombres en inglés, descriptivos, sin abreviar innecesariamente.
- Sin código muerto, sin `print`/`debugPrint` de debug, sin TODOs sueltos en el resultado final.
- Código bien optimizado: evita rebuilds innecesarios (usa `select`, `.family`, `autoDispose` donde corresponda), separa widgets para que Riverpod solo reconstruya lo necesario, evita lógica de negocio dentro de widgets.
- **Nada a medias**: si empiezas una pantalla o un flujo, termínalo completo (loading, error, éxito, validaciones) antes de darlo por hecho. No dejes un TODO ni un "esto lo completo después" salvo que lo hayas acordado explícitamente conmigo.
- Antes de generar código que dependa de estructuras existentes (modelos, providers, rutas), **lee el archivo real primero** — nunca asumas cómo está hecho algo que ya existe en el repo.

## Consumo de la API

- Consumo real del backend (`GET /pedidos`, `POST /pedidos`, `PATCH /pedidos/:id/estado`) — nada de datos fijos (mock/hardcodeados) en el código final.
- Maneja explícitamente los tres estados de cualquier llamada: cargando, error (con mensaje visible al usuario) y éxito, usando los estados sellados de Freezed/Riverpod (`AsyncValue` o equivalente propio).

## Git y ramas

- **Nunca commitees directo a `main`/`develop`.**
- Todo trabajo va en una rama con el prefijo `feature/`, ejemplo: `feature/lista-pedidos`, `feature/crear-pedido-form`.
- Una rama por unidad de trabajo coherente — no mezcles features distintas en la misma rama.
- **Nunca hagas commit ni push por tu cuenta.** Tu trabajo termina en dejar los cambios listos en el working tree: cuando termines una unidad de trabajo, avisa explícitamente que está lista para revisión y commit — el commit y el push los hace Hector siempre.
- Al avisar que algo está listo, resume brevemente qué cambió, para que el mensaje de commit lo pueda redactar Hector con contexto.
- Antes de abrir una rama nueva, confirma que la anterior quedó mergeada o explícitamente pausada.

## Antes de implementar

- Para cualquier cambio no trivial (nueva feature, nuevo provider, nueva dependencia), **explica en 2-3 líneas tu plan y espera confirmación** antes de escribir el código.
- Si algo del enunciado o requisito es ambiguo, pregunta en vez de asumir.
- Al terminar una feature, corre `build_runner`, valida que la app compile y que el flujo completo (carga/error/éxito) funcione antes de dar por cerrada la tarea.
