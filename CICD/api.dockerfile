FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build

WORKDIR /app

# Copy  csproj and restore as distinct layers
COPY ./**/*.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY backendapp/. ./backendapp/
WORKDIR /app/backendapp
RUN dotnet publish -c Relase -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build /app/backendapp/out ./

ENTRYPOINT ["dotnet", "backendapp.dll"]