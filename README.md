# 🔴 Pokédex - Global66 Prueba Técnica

Aplicación móvil desarrollada en **Flutter** que consume la [PokéAPI](https://pokeapi.co/) para mostrar un listado de Pokémon, sus detalles, agregar favoritos y funcionalidades futuras :DD. 

* Detalle no menor a notar, se cambió el logo de la aplicación por una maleta pokemon ⚡️.

<img width="115" height="112" alt="image" src="https://github.com/user-attachments/assets/5c457dec-ec37-4e95-aa1b-30016775ec99" />



https://github.com/user-attachments/assets/8e2e9b91-3815-4bbf-bfb5-e2de56813bbc



https://github.com/user-attachments/assets/09f81538-bad6-4fc1-a873-b898b1f2fa2a



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

  El proyecto lo decidí correr en esta versión de flutter pues, mi maquina es algo viejita y no me permitió hacer una actualización más reciente del framework por el sistema operativo que manejo actualmente.

- **Dart SDK** (incluido con Flutter)

- **Android Studio** / **Xcode** / **VSCode** (según la plataforma)

- Un emulador o dispositivo físico conectado.

  Recomeido mucho más correr la app en dispositivo fisico para poder apreciar con más detenimiento los detalles que se incluyeron en el proyecto. Pero, corre de igual manera en emulador Android y iOS.

### Pasos

1.  **Clonar el repositorio:**

```bash

git  clone  https://github.com/alejandrasilvalvarez/global66_prueba_pokemon.git

cd  global66_prueba_pokemon

```

2.  **Instalar dependencias:**

```bash

flutter  pub  get

```

3.  **Generar código (Freezed, JSON Serializable, Localizations):**

```bash

dart  run  build_runner  build  --delete-conflicting-outputs

```

Este comando nos permitirá generar los archivos necesarios para la ejecusión de la aplicación.

5.  **Ejecutar la aplicación:**

```bash

flutter  run

```

6.  **Ejecutar los tests:**

```bash

flutter  test

```

Si bien no es necesario para la ejecución de la aplicación, siempre está bien saber que la aplicación está testeada y funciona correctamente.

---

## 🏛️ Arquitectura

La aplicación sigue **Clean Architecture** con el patrón **MVVM** en la capa de presentación, organizada por features (feature-first). Se dividió de esa manera para poder centralizar comportamientos de flujos, como Onboarding, las funcionalidades dle Dashboard (homeview).

### Estructura de Carpetas

```

lib/

├── core/ # Módulos transversales

│ ├── commons/ # Logger (AppLogger)

│ ├── environment/ # Configuración de ambientes (QA, PROD, PT)

│ ├── error/ # Clases de Failure (ServerFailure, NetworkFailure, etc.)

│ ├── http/ # HttpService, interceptores (DioInterceptor, ApiCInterceptor)

│ ├── internacionalization/ # i18n con AppLocalizations (ES/EN)

│ │ └── l10n/ # Archivos .arb y generados

│ ├── network/ # Verificación de conectividad (NetworkInfo)

│ ├── routes/ # Configuración de GoRouter

│ ├── ui/ # Tema, colores de tipos Pokémon, mappers de errores

│ └── util/ # Utilidades generales

│

├── design_system/ # Sistema de diseño reutilizable

│ ├── components/ # PrimaryButton, FavouriteButton, PokemonCardShimmer, etc.

│ ├── extensions/ # Extensiones de estilos de texto

│ ├── illustrations/ # Constantes de assets SVG/PNG

│ └── ui_constants/ # Spacing, UILayout, Colors, BorderRadius

│

├── features/ # Features organizadas por dominio

│ ├── dashboard/ # Listado principal + detalle de Pokémon

│ │ ├── data/

│ │ │ ├── datasources/ # DashboardRemoteDatasource (abstract + impl)

│ │ │ ├── models/ # Modelos Freezed + mappers a entidades

│ │ │ │ └── mappers/ # Mappers model → entity

│ │ │ └── repositories/ # DashboardRepositoryImpl

│ │ ├── di/ # Providers (inyección de dependencias con Riverpod)

│ │ ├── domain/

│ │ │ ├── entities/ # Pokemon, PokemonSmallDetail, PokedexDetail, PokemonSpecies

│ │ │ ├── repositories/ # Interfaces abstractas (DashboardRepository, FavouritesRepository)

│ │ │ └── usecases/ # FetchPokemons, FetchPokemonSmallDetail, FetchPokedexDetail,

│ │ │ # GetFavourites, ToggleFavouritePokemon

│ │ └── presentation/

│ │ ├── pages/ # HomeView, PokedexDetailView

│ │ ├── state/ # DashboardState (Freezed union: loading/error/data)

│ │ ├── viewmodel/ # DashboardViewModel, FavoritesViewModel

│ │ └── widgets/ # PokemonCard, PokedexDetail, PokedexDetailHeader, PokedexDetailBody

│ │

│ ├── favourites/ # Vista de favoritos

│ │ └── presentation/

│ │ ├── pages/ # FavouritesView

│ │ └── viewmodel/

│ │

│ ├── onboarding/ # Onboarding + Splash

│ │ └── presentation/

│ │ ├── state/ # OnboardingState

│ │ ├── view/ # SplashScreen, OnboardingView

│ │ ├── viewmodel/ # SplashViewModel, OnboardingViewModel

│ │ └── widgets/ # OnboardingCarouselDot, etc.

│ │

│ ├── main_wrapper/ # Shell con BottomNavigationBar

│ │ ├── pages/ # MainScreen

│ │ ├── state/ # NavigationState

│ │ └── viewmodel/ # NavigationViewModel

│ │

│ ├── profile/ # Perfil de usuario

│ │ └── presentation/

│ │ ├── pages/ # ProfileView

│ │ └── viewmodel/

│ │

│ └── regions/ # Regiones Pokémon

│ └── presentation/

│ ├── pages/ # RegionsView

│ └── viewmodel/

│

├── main.dart # Entry point

│

properties/ # Variables de entorno por ambiente

├── QA/.env.qa

└── PROD/.env.prod

│

test/Features/ # Tests organizados por feature

├── dashboard/

│ ├── data/ # Tests de repositorios y mappers

│ ├── domain/ # Tests de use cases

│ └── presentation/ # Tests de ViewModels y widgets

├── main_wrapper/

└── onboarding/

```

Además se agregó un linter curado en el analysis_options.yaml para asegurar las mejores prácticas a la hora de escribir código
Se agruparon los widgets y las views por librerías para la facilidad en importar dependencias y exportar funcionalidades.

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

Permite amplia división de responsabilidades, protege la logica de negocio, elimina logica pesada de los widgets de Flutter, permite optimización en renderización, además de escalabilidad.

---

## 📱 Decisiones por Vista

### Splash Screen

- Se decidió eliminar el splash screen por defecto que tiene flutter para permitir una carga más bonita e inmersiva en la aplicación. Además, se aprovechó la fácilidad de una pokebola para hacer la carga dinamica y atractiva a los usarios.

### Onboarding

- Se decidió no importar el carousel_slider de flutter para el manejo del carrusel en la vista, peus, nos ahorramos así una dependencia, lo que nos permite más libertad a futuro, además de menos posibilidades en vulnerabilidades. En el diseño la implementación era realmente sencilla por lo que se optó por hacer el componente nativo.
- En esta pantalla se implementó el cambio de la internacionalización on demand gracias a un componente en la parte superior derecha de la pantalla, con lo cual se puede ajustar al idioma que se quiera la aplicación independiente de

### Home (Dashboard)

- sin lugar a duda la pantalla más compleja, tiene una carga inciail de la lista de los pokemones, pero, la api tiene una limitación y es que la lista se renderiza de modo que solo llega:

```
	[
	{
      "name": "bulbasaur",
      "url": "https://pokeapi.co/api/v2/pokemon/1/"
    },
    ...,
   ]
```

Pero en el diseño tenemos más información que l que llega, por lo que se hace una carga inicial de la lista de los pokemones y luego una carga por su detalle, del cual no se trae todo para agilizar el proceso de renderizad, sino exclusivamente lo necesario para el componente de PokemonCard.

Estas cards nos permiten también almacenar favoritos en el storage del celular, para esto se decidió implementar secure_storage, pues, si bien los pokemones favoritos no son necesariamente información sensible para el usuario, se opta por una opción segura que permite flutter y la información almacenada tampoco representa a nivel de "los datos guardados" algo clave, pues, solo se está guardando el indice de los pokemnos favoritos en un set, permitiendo más calma sobre la información que está siendo almacenada.

### Detalle Pokédex

- esta es a mi parecer la pantalla más bonita, la que más componentes pequeños maneja en la aplicación, hace una carga un poco más extensa sobre el detalle de los pokemones, además hace una pegada adicional para traer información extra necesaria según el diseño presentado, esta es:

```
pokemon-species/$id
```

### Favoritos

- El flujo de favoritos es realmente muy sencillo, permite eliminar del storage los pokemones favoritos, tiene su empty state, además de un appbar que permite la navegación de vuelta a la pantalla de home.

### Regiones

- Se implementa una pantalla sencilla de empty state, pues, no había ni diseño, ni tiempo para desarrollarla jeje.

### Perfil

- Se implementa una pantalla sencilla de empty state, pues, no había ni diseño, ni tiempo para desarrollarla jeje.

### Navegación Principal (MainWrapper)

- La navegación se hace con Go Router, además se implementa un sheel para la navegación por el navBar inferior.

## 🔒 Capas de Seguridad

### 1. Almacenamiento Seguro con `flutter_secure_storage`

Los favoritos del usuario se persisten usando `FlutterSecureStorage`, que utiliza:

- **iOS:** Keychain Services (cifrado por hardware).

- **Android:** EncryptedSharedPreferences con AES-256 (respaldado por AndroidKeyStore).

Esto garantiza que los datos locales están cifrados en reposo, a diferencia de `SharedPreferences` que almacena en texto plano.

### 2. Variables de Entorno con `flutter_dotenv`

Las configuraciones sensibles (URLs base, claves) se manejan a través de archivos `.env` que están excluidos del control de versiones (`.gitignore`). El archivo `Environment` soporta múltiples ambientes:

- `PROD` — Producción

- `QA` — Quality Assurance

Esto previene la exposición accidental de credenciales en el repositorio.

### 3. Abstracción de la Capa de Red

La comunicación HTTP se realiza a través de **Dio** con manejo centralizado de errores en `ErrorMapper`. Se clasifican los failures en tipos específicos:

- `ServerFailure` — Errores del servidor (5xx)

- `NetworkFailure` — Sin conexión a internet

- `CacheFailure` — Errores de almacenamiento local

- `AuthenticationFailure` — Errores de autenticación

Esto permite un manejo robusto de errores sin exponer detalles internos al usuario.

---

## 🤖 Uso de IA

- Usé ayuda de Claude para la generación de tests y la revisión de edge cases en casos en los que fuese necesario. Además de ayuda en tareas que podían ser "monotonas" o "repetitivas" como la creación de cascarones para la arquitectura.

### Herramienta utilizada

- Vscode - AntiGravity - claude
- Android emulator y dispositivo fisico

### Rules / Configuración

- No se le pidió generar la aplicación completa, sino asistir en tareas específicas. (como revisión de tests)
- Se mantuvo el criterio propio para decisiones de UX/UI.
- Se revisó manualmente cada sugerencia antes de aceptarla.

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

flutter  test

```

Para ejecutar con cobertura:

```bash

flutter  test  --coverage

```

---

Este proyecto ha sido desarrollado como prueba técnica para Global66.
