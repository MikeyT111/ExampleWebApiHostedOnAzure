FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app

ENV ASPNETCORE_URLS=http://0.0.0.0:5000

EXPOSE 5000

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

COPY . .

WORKDIR "/src/."

RUN dotnet restore "./TestWebApi.csproj"
RUN dotnet build "TestWebApi.csproj" -c Release -o /app/build
FROM build AS publish
RUN dotnet publish "TestWebApi.csproj" -c Release -o /app/publish


FROM mcr.microsoft.com/dotnet/sdk:7.0 AS test

COPY . .

WORKDIR "/tests/."

RUN dotnet test "./TestWebApiCTests.csproj" --logger:trx

FROM base AS final

WORKDIR /app
COPY --from=publish /app/publish .

ENTRYPOINT ["dotnet", "TestWebApi.dll"]