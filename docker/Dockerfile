FROM microsoft/dotnet:sdk AS build-env

WORKDIR /src

# Copy everything else and build
COPY . ./
COPY ./nuget.build.config ./nuget.config
RUN dotnet publish -c Release -o /app Products/Products.csproj

# Build runtime image
FROM microsoft/dotnet:aspnetcore-runtime
WORKDIR /app
EXPOSE 80
COPY --from=build-env /app .
ENTRYPOINT ["dotnet", "Microservice.dll"]
