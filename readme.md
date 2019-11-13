# .Net Core 3.0 sample


# build

```
docker build -t webapp-dotnet3 .
docker run -it --rm -p 5000:80 --name webapp-dotnet3 webapp-dotnet3
```

# docker login to dockerhub

```
docker login
```

# tag the image for dockerhub

```
docker tag webapp-dotnet3 jaricsng/webapp-dotnet3:0.1
``` 

# push image to dockerhub

```
docker push jaricsng/webapp-dotnet3:0.1
```


## Notes

the application has two tags 0.1 and 0.2.


### Build and deploy manually

Navigate to the project folder at cd webapp-dotnet3

```
dotnet publish -c Release -o published
```

### Linux: run the application

```
dotnet published/webapp-dotnet3.dll
```

# Troubleshooting

## Mac: find port already in used

```
netstat -vanp tcp | grep <port>
```


# Resources

- Docker images for [ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/host-and-deploy/docker/building-net-docker-images?view=aspnetcore-3.0)
- helm demo chart : https://ibmcloudprivate2.github.io/mycharts/