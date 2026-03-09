# 🔴 Pokédex - Global66 Prueba Técnica

Aplicación móvil desarrollada en **Flutter** que consume la [PokéAPI](https://pokeapi.co/) para mostrar un listado de Pokémon, sus detalles, favoritos y más.

---

## 📋 Tabla de Contenidos

- [Cómo Correr el Proyecto](#-cómo-correr-el-proyecto)
- [Arquitectura](#-arquitectura)
- [Decisiones por Vista](#-decisiones-por-vista)
- [Capas de Seguridad](#-capas-de-seguridad)
- [Uso de IA](#-uso-de-ia)
- [Stack Tecnológico](#-stack-tecnológico)
- [Testing](#-testing)

---

## 🚀 Cómo Correr el Proyecto

### Prerrequisitos

- **Flutter SDK** >= 3.11.1
- **Dart SDK** (incluido con Flutter)
- **Android Studio** / **Xcode** (según la plataforma)
- Un emulador o dispositivo físico conectado

### Pasos

1. **Clonar el repositorio:**

```bash
git clone https://github.com/alejandrasilvalvarez/global66_prueba_pokemon.git
cd global66_prueba_pokemon
```

2. **Instalar dependencias:**

```bash
flutter pub get
```

3. **Generar código (Freezed, JSON Serializable, Localizations):**

```bash
dart run build_runner build --delete-conflicting-outputs
```

4. **Crear el archivo de variables de entorno:**

```bash
cp .env.example .env
```

> ⚠️ Si no existe `.env.example`, crear un archivo `.env` en la raíz del proyecto con las variables necesarias.

5. **Ejecutar la aplicación:**

```bash
flutter run
```

6. **Ejecutar los tests:**

```bash
flutter test
```

---

## 🏛️ Arquitectura

La aplicación sigue **Clean Architecture** con el patrón **MVVM** en la capa de presentación, organizada por features.

### Estructura de Carpetas

```
lib/
├── core/                          # Módulos transversales
│   ├── environment/               # Configuración de ambientes (QA, PROD, PT)
│   ├── error/                     # Clases de Failure (ServerFailure, NetworkFailure, etc.)
│   ├── http/                      # Decodificadores HTTP y modelos de respuesta
│   ├── internacionalization/      # i18n con AppLocalizations (ES/EN)
│   ├── network/                   # Verificación de conectividad
│   ├── routes/                    # Configuración de GoRouter
│   └── ui/                        # Tema, colores de tipos Pokémon
│
├── design_system/                 # Sistema de diseño reutilizable
│   ├── components/                # Botones, shimmer, flags de tipo, etc.
│   ├── extensions/                # Extensiones de estilos de texto
│   ├── illustrations/             # Constantes de assets SVG/PNG
│   └── ui_constants/              # Spacing, Layout, Colors, BorderRadius
│
├── features/                      # Features organizadas por dominio
│   ├── dashboard/                 # Listado principal de Pokémon
│   │   ├── data/
│   │   │   ├── datasources/       # DashboardRemoteDatasource (abstract + impl)
│   │   │   ├── models/            # Modelos Freezed + mappers a entidades
│   │   │   └── repositories/      # DashboardRepositoryImpl
│   │   ├── di/                    # Providers (inyección de dependencias con Riverpod)
│   │   ├── domain/
│   │   │   ├── entities/          # Pokemon, PokemonSmallDetail, PokedexDetail
│   │   │   ├── repositories/      # Interfaces abstractas
│   │   │   └── usecases/          # FetchPokemons, FetchPokemonSmallDetail, etc.
│   │   └── presentation/
│   │       ├── pages/             # HomeView, PokedexDetailView
│   │       ├── state/             # DashboardState (Freezed union: loading/error/data)
│   │       ├── viewmodel/         # DashboardViewModel, FavoritesViewModel
│   │       └── widgets/           # PokemonCard, PokedexDetail widgets
│   │
│   ├── favourites/                # Vista de favoritos
│   ├── onboarding/                # Onboarding con carousel
│   ├── main_wrapper/              # Shell con BottomNavigationBar
│   ├── profile/                   # Perfil de usuario
│   └── regions/                   # Regiones Pokémon
│
└── main.dart                      # Entry point
```

### Flujo de Datos (Clean Architecture)

```
View (ConsumerWidget)
  ↓ watch
ViewModel (Notifier)
  ↓ read
UseCase
  ↓ call
Repository (abstract — domain layer)
  ↓ implementado por
RepositoryImpl (data layer)
  ↓ delega a
Datasource (abstract + impl)
  ↓ 
API remota (Dio) / Almacenamiento local (FlutterSecureStorage)
```

**Principio clave:** Las dependencias siempre apuntan hacia adentro. La capa de presentación solo conoce el dominio; la capa de datos implementa las interfaces del dominio. Ningún ViewModel importa clases concretas `*Impl`.

### ¿Por qué Clean Architecture + MVVM?

<!-- TODO: Explica aquí tus razones personales para elegir esta arquitectura -->
<!-- Ejemplo: Separación clara de responsabilidades, facilidad para testear, escalabilidad del proyecto, etc. -->

---

## 📱 Decisiones por Vista

### Splash Screen
<!-- TODO: Describe las decisiones de diseño y UX del splash -->
<!-- Ejemplo: Animación con PokeBolaLoader, transición automática al onboarding, tiempo de espera, etc. -->

### Onboarding
<!-- TODO: Describe las decisiones del onboarding -->
<!-- Ejemplo: Carousel con PageView de 2 páginas, soporte i18n (ES/EN) con dropdown de idioma, dots indicator para navegación, botón "Continuar"/"Comenzar" según la página, etc. -->

### Home (Dashboard)
<!-- TODO: Describe las decisiones del dashboard -->
<!-- Ejemplo: Listado con scroll, PokemonCard con shimmer loading, barra de búsqueda, manejo de estados loading/error/data con Freezed union types, cada card muestra nombre + tipos + imagen + botón favorito, navegación al detalle con go_router, etc. -->

### Detalle Pokédex
<!-- TODO: Describe las decisiones de la vista de detalle -->
<!-- Ejemplo: Header con imagen y colores del tipo primario, body con stats, tipos, debilidades, descripción en español, datos de género, peso y altura, etc. -->

### Favoritos
<!-- TODO: Describe las decisiones de la vista de favoritos -->
<!-- Ejemplo: Persistencia local con FlutterSecureStorage, toggle inmediato en UI con actualización optimista, uso del UseCase ToggleFavoritePokemon, etc. -->

### Regiones
<!-- TODO: Describe las decisiones de la vista de regiones -->

### Perfil
<!-- TODO: Describe las decisiones de la vista de perfil -->

### Navegación Principal (MainWrapper)
<!-- TODO: Describe las decisiones del BottomNavigationBar -->
<!-- Ejemplo: StatefulShellRoute de GoRouter para mantener el estado de cada tab, 4 tabs (Home, Regiones, Favoritos, Perfil), etc. -->

---

## 🔒 Capas de Seguridad

### 1. Almacenamiento Seguro con `flutter_secure_storage`

Los favoritos del usuario se persisten usando `FlutterSecureStorage`, que utiliza:
- **iOS:** Keychain Services (cifrado por hardware).
- **Android:** EncryptedSharedPreferences con AES-256 (respaldado por AndroidKeyStore).

Esto garantiza que los datos locales están cifrados en reposo, a diferencia de `SharedPreferences` que almacena en texto plano.

<!-- TODO: Si usaste flutter_secure_storage para algo más, descríbelo aquí -->

### 2. Variables de Entorno con `flutter_dotenv`

Las configuraciones sensibles (URLs base, claves) se manejan a través de archivos `.env` que están excluidos del control de versiones (`.gitignore`). El archivo `Environment` soporta múltiples ambientes:
- `PROD` — Producción
- `QA` — Quality Assurance
- `PT` — Pre-producción

Esto previene la exposición accidental de credenciales en el repositorio.

### 3. Abstracción de la Capa de Red

La comunicación HTTP se realiza a través de **Dio** con manejo centralizado de errores en `ErrorMapper`. Se clasifican los failures en tipos específicos:
- `ServerFailure` — Errores del servidor (5xx)
- `NetworkFailure` — Sin conexión a internet
- `CacheFailure` — Errores de almacenamiento local
- `AuthenticationFailure` — Errores de autenticación

Esto permite un manejo robusto de errores sin exponer detalles internos al usuario.

### 4. Verificación de Conectividad

`NetworkInfo` con `internet_connection_checker` permite verificar la conectividad antes de realizar llamadas de red, mejorando la experiencia de usuario con mensajes de error apropiados.

<!-- TODO: Agrega cualquier otra capa de seguridad que hayas implementado -->

---

## 🤖 Uso de IA

<!-- TODO: Completa esta sección con tu experiencia real -->

### Herramienta utilizada

<!-- Ejemplo: Antigravity (Claude), GitHub Copilot, ChatGPT, etc. -->

### ¿Cómo la usé?

<!-- TODO: Describe cómo usaste la IA en este proyecto -->
<!-- Ejemplo:
- Revisión de arquitectura: La IA me ayudó a identificar violaciones del principio de dependencia (ViewModels importando clases concretas `*Impl` en vez de interfaces abstractas del dominio).
- Refactoring guiado: Me ayudó a crear los UseCases faltantes y a reorganizar los providers para que sigan consistentemente el patrón Clean Architecture.
- Generación de tests unitarios: Utilicé IA para generar la estructura base de los test files.
- Pair programming: La IA actuó como un segundo par de ojos para detectar patrones inconsistentes en el código.
-->

### Rules / Configuración

<!-- TODO: Describe las reglas o configuración que usaste con la IA -->
<!-- Ejemplo:
- No se le pidió generar la aplicación completa, sino asistir en tareas específicas.
- Se mantuvo el criterio propio para decisiones de UX/UI.
- Se revisó manualmente cada sugerencia antes de aceptarla.
-->

### ¿Qué problemas me resolvió?

<!-- TODO: Lista los problemas específicos que la IA te ayudó a resolver -->
<!-- Ejemplo:
1. Violación de la regla de dependencia: Los providers exponían tipos concretos (`Provider<FavouritesRepositoryImpl>`) en vez de abstractos (`Provider<FavouritesRepository>`).
2. Inconsistencia en uso de UseCases: Algunos providers llamaban al repositorio directamente, saltándose la capa de casos de uso.
3. Falta de interfaz abstracta para `FavouritesLocalDatasource`.
4. Bug de test anidado: `test()` envolviendo `testWidgets()` causando tests silenciosamente ignorados.
-->

---

## 🛠️ Stack Tecnológico

| Categoría | Tecnología | Uso |
|---|---|---|
| **Framework** | Flutter 3.11+ | Desarrollo multiplataforma |
| **State Management / DI** | Riverpod 3.2 | Inyección de dependencias y gestión de estado |
| **Navegación** | GoRouter 17.1 | Navegación declarativa con `StatefulShellRoute` |
| **HTTP Client** | Dio 5.9 | Llamadas a la API REST |
| **Modelos inmutables** | Freezed 3.2 + json_serializable | Generación de código para modelos y estados |
| **Almacenamiento seguro** | flutter_secure_storage 10.0 | Persistencia cifrada de favoritos |
| **Internacionalización** | flutter_localizations + intl | Soporte multilenguaje (ES/EN) |
| **Variables de entorno** | flutter_dotenv 6.0 | Manejo de configuración por ambiente |
| **Conectividad** | internet_connection_checker 3.0 | Detección de estado de red |
| **Imágenes vectoriales** | flutter_svg 2.2 | Renderizado de iconos SVG |
| **Loading** | shimmer 3.0 | Efecto shimmer en carga de datos |
| **Testing** | flutter_test + mocktail 1.0 | Tests unitarios y de widgets con mocks |

---

## 🧪 Testing

La aplicación incluye tests en múltiples capas:

- **Data Layer:** Tests de repositorios y mappers
- **Domain Layer:** Tests de use cases
- **Presentation Layer:** Tests de ViewModels y widgets

Para ejecutar todos los tests:

```bash
flutter test
```

Para ejecutar con cobertura:

```bash
flutter test --coverage
```

---

## 📄 Licencia

Este proyecto ha sido desarrollado como prueba técnica para Global66.
