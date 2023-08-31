FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /
COPY ["Directory.Build.props", "./"]
COPY ["src", "./src"]

WORKDIR /src/BlazingPizza.Server
RUN dotnet restore "BlazingPizza.Server.csproj"
RUN dotnet build "BlazingPizza.Server.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "BlazingPizza.Server.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "BlazingPizza.Server.dll"]