FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY webapp-dotnet3/*.csproj ./webapp-dotnet3/
RUN dotnet restore

# copy everything else and build app
COPY webapp-dotnet3/. ./webapp-dotnet3/
WORKDIR /app/webapp-dotnet3
RUN dotnet publish -c Release -o out


FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS runtime
WORKDIR /app
COPY --from=build /app/webapp-dotnet3/out ./
ENTRYPOINT ["dotnet", "webapp-dotnet3.dll"]