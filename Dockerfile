FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY App.class .

# Main program fixed
ENTRYPOINT ["java", "App"]

# Default args (can override when running)
CMD ["8080"]
