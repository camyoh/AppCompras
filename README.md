# App Compras

<img src="https://github.com/camyoh/PruebaMeli/blob/main/Videos/video1.gif" width="250"> <img src="https://github.com/camyoh/PruebaMeli/blob/main/Videos/video2.gif" width="250"> <img src="https://github.com/camyoh/PruebaMeli/blob/main/Videos/video3.gif" width="250"> <img src="https://github.com/camyoh/PruebaMeli/blob/main/Videos/RPReplay_Final1712090351.gif" width="250">

Este proyecto está diseñado para realizar búsquedas y mostrar detalles de productos utilizando la API de Mercado Libre. Está estructurado siguiendo los principios de la arquitectura limpia y los principios SOLID, lo que facilita la modularidad, la escalabilidad y el mantenimiento del código.

Se utiliza el patrón de coordinador para gestionar el flujo de vistas en la aplicación. El coordinador se encarga de iniciar la navegación entre las diferentes pantallas, lo que permite una separación clara de responsabilidades y un mayor control sobre la navegación.

Se han escrito pruebas unitarias para verificar el correcto funcionamiento de los casos de uso y la lógica de presentación. Las pruebas unitarias se centran en probar el comportamiento de cada componente de forma aislada, garantizando la robustez y la calidad del código.

La aplicación implementa funcionalidades de paginación al llegar al final de la lista de resultados, cuando el usuario desplaza la lista de resultados y llega al final, se realiza automáticamente una nueva solicitud a la API para cargar más resultados. 

## SDWebImage
Se hizo uso de [SDWebImage](https://github.com/SDWebImage/SDWebImage) como dependencia usando SPM, esto para el manejo de carga de imágenes desde la url propocionada, para facilitar el uso de la descarga y almacenamiento en caché de las mismas.

## Networking
La carpeta Networking contiene la lógica relacionada con la comunicación de la aplicación con la API de Mercado Libre. Está estructurada de la siguiente manera:

### Repository
**Clase Repository:** Implementa el protocolo RepositoryProtocol y se encarga de realizar solicitudes a la API de Mercado Libre para obtener detalles de productos, resultados de búsqueda y sugerencias de búsqueda. Utiliza un ServicesManager para realizar las solicitudes HTTP.

**Protocolo RepositoryProtocol:** Define métodos para obtener resultados de búsqueda, sugerencias de búsqueda y detalles de productos.

### Services Manager
**Protocolo ServicesManagerProtocol:** Define un método para realizar solicitudes HTTP y decodificar los datos de respuesta en objetos Swift.

**Clase ServicesManager:** Implementa el protocolo ServicesManagerProtocol y se encarga de enviar las solicitudes HTTP utilizando un cliente de API (ApiClientProtocol) y decodificar los datos de respuesta utilizando un decodificador de datos (DataDecoderProtocol).

### Decodificación de Datos
**Protocolo DataDecoderProtocol:** Define un método para decodificar datos en objetos Swift.

**Clase JSONDecoderWrapper:** Implementa el protocolo DataDecoderProtocol utilizando un JSONDecoder estándar para decodificar datos JSON en objetos Swift.

### Cliente de API
**Protocolo ApiClientProtocol:** Define un método para realizar solicitudes HTTP y obtener los datos de respuesta.

**Clase URLSessionAPIClient:** Implementa el protocolo ApiClientProtocol utilizando URLSession para realizar las solicitudes HTTP y manejar las respuestas.

### Puntos finales de la API
**Enum MeliEndpoint:** Enumera los diferentes puntos finales de la API de Mercado Libre, como la búsqueda de productos, las sugerencias de búsqueda y los detalles del producto. También proporciona métodos para construir URLs válidas para cada punto final

## ErrorHandler
En esta carpeta se definen las estructuras relacionadas con el manejo de errores de la aplicación, así como la generación de alertas correspondientes a estos errores.

**ApiError:** Enumeración que representa los posibles errores que pueden ocurrir al interactuar con la API.

**ErrorAlertFactory:** Estructura que proporciona métodos estáticos para crear alertas de error basadas en los errores de la API.

## Entities
Contiene las estructuras de datos que representan las entidades utilizadas en la aplicación.

**ItemEntity:** Representa un artículo/producto con sus atributos.

**SuggestionEntity:** Representa una sugerencia de búsqueda.

**ResultsEntity:** Representa los resultados de una búsqueda.

Otras estructuras relacionadas con atributos, imágenes, filtros, etc.

## Utils
Aquí se encuentran utilidades y constantes utilizadas en toda la aplicación.

**AppConstants:** Contiene constantes utilizadas en la aplicación, como texto de marcadores de posición y títulos.

**Country:** Enumeración que define los códigos de país utilizados en Mercado Libre.

**Utils:** Proporciona métodos útiles, como obtener el país actual y su moneda.

## Navigation
Contiene el código relacionado con la navegación y coordinación entre las distintas pantallas de la aplicación.

**CoordinatorProtocol:** Protocolo que define los métodos necesarios para coordinar la navegación.

**Coordinator:** Implementación del coordinador que maneja la navegación entre las diferentes pantallas.

## AutoSuggestions
En esta carpeta se encuentran las funcionalidades relacionadas con las sugerencias de búsqueda automática.

**FetchSuggestionsUseCase:** Caso de uso para obtener sugerencias de búsqueda.

**SuggestionsViewModel:** ViewModel que maneja la lógica de las sugerencias de búsqueda.

**SuggestionsViewController:** Controlador de vista que muestra las sugerencias de búsqueda.

## ProductDetails
Aquí se gestionan los detalles de los productos seleccionados.

**FetchItemUseCase:** Caso de uso para obtener detalles de un producto.

**DetailViewModel:** ViewModel que maneja la lógica de los detalles del producto.

**DetailViewController:** Controlador de vista que muestra los detalles del producto.

## ResultList
En esta carpeta se manejan los resultados de búsqueda de productos.

**FetchResultsUseCase:** Caso de uso para obtener resultados de búsqueda.

**ListViewModel:** ViewModel que maneja la lógica de los resultados de búsqueda.

**ListViewController:** Controlador de vista que muestra la lista de resultados de búsqueda.
