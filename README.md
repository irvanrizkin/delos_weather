# Delos Weather

Showing weather from OpenWeather API

## Install
1. Run this if pubspec.lock is not exist
```
flutter pub get
```
2. Create your own .env. Change to your OpenWeather API key
```
cp .env.example .env
nano .env
```
3. Run this to generate JSON Serializable
```
dart run build_runner build
```
4. Search for "Run" or "Debug" in your desired IDE 

## Architecture
- Data
    - Data Source
    - Models
    - Repository Implementation
- Domain
    - Entities
    - Repository
    - Usecases
- Presentation
    - Bloc
    - Pages
    - Widgets

## Library Used
### flutter_bloc
**Reason** : Better documentation, many Clean Architecture tutorial uses Bloc

### equatable
**Reason** : Works well for comparing state changes in Bloc

### get_it
**Reason** : Easy dependency injection rather than nested injection

### intl
**Reason** : Format UNIX date from Weather API response

### flutter_hooks
**Reason** : Simplify widget lifecycle management

### cached_network_image
**Reason** : Saving bandwidth rather than download images again and again

### json_serializable, json_annotation, build_runner
**Reason** : Easier for generate fromJson and toJson

### dio
**Reason** : More customizable, available with pretty_dio_logger

### fpdart
**Reason** : For functional programming on control flow rather than try catch

### Flutter_dotenv
**Reason** : Hide API key from source control
