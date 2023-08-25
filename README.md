# ExampleWebApiHostedOnAzure
An example webapi that is hosted in Azure with Infrastructure as code.

To get this project up and runnning execute the following commands. 
```
docker build -t testwebapi .
```

```
docker run -p 5000:5000 testwebapi
```

Go to your browser and navigate to the following url: http://localhost:5000/weatherforecast
You will be displayed something like 
```
[
    {"date":"2023-08-26","temperatureC":13,"temperatureF":55,"summary":"Scorching"},
    {"date":"2023-08-27","temperatureC":20,"temperatureF":67,"summary":"Mild"},
    {"date":"2023-08-28","temperatureC":-17,"temperatureF":2,"summary":"Mild"},
    {"date":"2023-08-29","temperatureC":21,"temperatureF":69,"summary":"Sweltering"},
    {"date":"2023-08-30","temperatureC":50,"temperatureF":121,"summary":"Scorching"}
]
```