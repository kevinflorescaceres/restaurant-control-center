# Centro de Control de Restaurantes

Aplicación diseñada para monitorear desde una vista central el estado de distintas tiendas, junto con sus dispositivos y servidores. Desarrollada en marzo de 2024.

## Información Técnica

* Versión de Ruby: 3.2.2

* Versión de Rails: 7.1.3.2

## Instrucciones

### Pasos para construir la aplicación

```
1. bin/bundle install

2. bin/rails db:seed
```

### Procesos (ejecutar en distintas terminales)

```
bin/rails s

redis-server

sidekiq
```

### Clases

#### Clase Tienda (Store)
Modelo principal del programa. Posee distintos atributos informativos, y tiene muchos (has_many) dispositivos y servidores.

**Estado**: El estado de una tienda depende del estado de sus dispositivos. Existen tres opciones:

1. 'ok': todos los dispositivos y servidores están en estado 'ok'.

2. 'warning': uno o más de sus dispositivos y servidores (pero no todos) están en estado 'error'.

3. 'error': todos los dispositivos y servidores están en estado 'error'.

#### Clase Dispositivo (Device)
Modelo correspondiente a periféricos pertenecientes (belongs_to) a una tienda. Posee un tipo: impresora ('printer').

**Estado**: Se decidió simular el estado de comunicación con los dispositivos mediante una función que tenga ciertas probabilidades de cambiar su estado:

- Cuando el dispositivo esté en estado 'ok' y se consulte su estado, existe un 95% de probabilidades de que la comunicación se mantenga (y mantenga su estado 'ok'); por lo tanto, existe un 5% de probabilidad de que la comunicación con el dispositivo no se efectúe, y su estado cambie a 'error'.
- Cuando el dispositivo esté en estado 'error', existe un 65% de probabilidad de que la desconexión se mantenga (y mantenga su estado 'error'). Por lo tanto, existe un 35% de probabilidad de que la conexión con el dispositivo se reestablezca (y su estado cambie a 'ok').


#### Clase Servidor (Server)
Modelo correspondiente a los distintos servidores de una tienda (belongs_to Tienda). Posee dos tipos: servidores web ('web') y servidores de bases de datos ('database').

**Estado**: La comunicación con los servidores se simuló de la siguiente manera:

1. Servidores web: Se decidió comprobar el estado de la conexión con sitios web de restaurantes reales. Se decidió actualizar el estado según la respuesta a un request de la dirección web. Si el código de la respuesta es 200, el estado será 'ok'; en caso contrario, el estado cambiará a 'error'.

2. Bases de datos: A falta de bases de datos reales de restaurantes a las cuales poder consultar por su estado, se decidió acoplar el estado de la base de datos de un servidor al estado de su servidor web. Esto va a cambiar en una futura versión, en la medida que aparezca una base de datos a la cual hacer 'ping' para consultar su estado.


### Gemas usadas

[Rubocop](https://rubocop.org/): utilizada para seguir un formato estándar para los archivos .rb

[Pry](https://github.com/pry/pry): Utilizada para inspeccionar el comportamiento de métodos y controladores durante el desarrollo

### Recursos utilizados

[Bootstrap](https://getbootstrap.com/docs/5.0/getting-started/introduction/): utilizada versión 5.0.2

[Online Web Fonts](https://onlinewebfonts.com/): utilizado para obtener fuentes adineue Pro y adineue Pro Bold 
