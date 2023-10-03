# Team Picas => Frontend

Nuestra aplicación se llama  *Desmoche: Baraja Pinolera*

Es una versión digital del clasico Desmoche **nicaragüense**. 

### Convervando las reglas clasicas:
- Victoria por color 
- 4 cuerpos
- *peladilla* (Sin juegos)
  

## ¿Por qué elegimos flutter?

Queremos que nuestra aplicacion se ejecute en todos los dispositivos moviles, tanto IOS como Android.
Y flutter es un framework moderno que cumple estas caracteristicas ya que nos permite mantener una velocidad nativa
ya que flutter compila creando un proyecto para xcode y android studio.


### Como funciona nuestra app?
- El Backend genera aleatoriamente 52 cartas
- Cuenta con 3 partes, "los jugadores, el mazo y la pila de descarte"
- El jugador esta dividido entre:
- - Una mano (que al inicio se carga con 9 cartas del mazo)
- - Un arreglo bidimencional donde se agregaran los juegos del jugador
- El backend envia la posicion de las 52 cartas a cada jugador
- Los jugadores modifican con sus jugadas y se emiten con un web-socket
- El resto de jugadores recibirán las modificaciones y el app las renderiza

# Flujo de navegación

![alt text](https://github.com/AnibalDev/team_picas_flutter_frontend/blob/main/app_images/diagrama_navegacion.png?raw=true)

# App Screenshots

## Login View
![alt text](https://github.com/AnibalDev/team_picas_flutter_frontend/blob/main/app_images/login_view.png?raw=true)

## Home View
![alt text](https://github.com/AnibalDev/team_picas_flutter_frontend/blob/main/app_images/home_view.png?raw=true)

## Play View
![alt text](https://github.com/AnibalDev/team_picas_flutter_frontend/blob/main/app_images/play_view.png?raw=true)

## Game View
![alt text](https://github.com/AnibalDev/team_picas_flutter_frontend/blob/main/app_images/game_view.png?raw=true)

