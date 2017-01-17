# Notes on using the golang [gost](https://github.com/Geodan/gost) implementation of the [OGC sensorthings specification](http://docs.opengeospatial.org/is/15-078r6/15-078r6.html).

## Other Implementations and related projects.
There is also a javascript node implementation called [whiskers](https://github.com/eclipse/whiskers) sponsored by the [Eclipse Foundation](https://eclipse.org/) for their [IoT](https://iot.eclipse.org/) project. that seems less mature. A second javascript [implementation](https://github.com/mozilla-sensorweb/sensorthings) is being developed by the Mozilla Foundation and looks a little more mature. It is being developed as part of Mozilla's IoT [Connected Devices](https://wiki.mozilla.org/Connected_Devices) project. The connected devices project also has a [ir Quality Sensor Network](https://wiki.mozilla.org/Sensor_Web) being developed. There are a series of YouTube videos in the [SensorUP](http://www.sensorup.com) YouTube [Channel](https://www.youtube.com/channel/UCRiwubGrY1zYSt4GOu3Ohvg). SensorUp is a commercial entity that is developing IoT solutions based on the OGC SensorThings standard.


## Installation
This repository contains a docker compose file that will automatically build the gost service stack from dockerhub and github repositories. It requires that [docker](https://www.docker.com/) be installed on your system. To launch the stack in the same directory as the compose file:

```bash
$ docker-compose up
```

The SensorThings spec also functions as a [MQTT](https://en.wikipedia.org/wiki/MQTT) broker. To publish and subscribe to the broker for the dorking exercises, [mosquitto](https://mosquitto.org/) is a useful command line tool. On MacOS, mosquitto is available in [homebrew](http://brew.sh/) using the following command:

```bash
$ brew install mosquitto
```

The REST API can be explored using curl or httpie. This note document assumes httpie.
To test the system has been started correctly.

```bash
$ http -j "http://localhost:8080/v1.0"
```

will result in:

```ssh


HTTP/1.1 200 OK
Content-Length: 893
Content-Type: application/json; charset=UTF-8
Date: Tue, 17 Jan 2017 16:02:49 GMT

{
  "value": [
  {
              "name": "Things",
                          "url": "http://localhost:8080/v1.0/Things"

  },
  {
              "name": "Datastreams",
                          "url": "http://localhost:8080/v1.0/Datastreams"

  },
  {
              "name": "ObservedProperties",
                          "url": "http://localhost:8080/v1.0/ObservedProperties"

  },
  {
              "name": "Locations",
                          "url": "http://localhost:8080/v1.0/Locations"

  },
  {
              "name": "Sensors",
                          "url": "http://localhost:8080/v1.0/Sensors"

  },
  {
              "name": "Observations",
                          "url": "http://localhost:8080/v1.0/Observations"

  },
  {
              "name": "FeaturesOfInterest",
                          "url": "http://localhost:8080/v1.0/FeaturesOfInterest"

  },
  {
              "name": "HistoricalLocations",
                          "url": "http://localhost:8080/v1.0/HistoricalLocations"

  }

  ]

}
```


## Installing synthetic data
A shell script [ghost_database_initialfill_demo.sh](ghost_database_initialfill_demo.sh) is located in this repository and can fill the server with synthetic data for demonstrating server capabilities. Additionally, the [Examples.md](Examples.md) is taken from the mozilla sensorthings repository and contains an interactive command line demonstration using curl.

## Proper dorking with the system

One of the "interesting" features of SensorThings is that it is a MQTT broker that can link MQTT Publications and Subscriptions.

