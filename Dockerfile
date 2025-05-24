# ----------- Stage 1: Build Layer -------------
FROM node:20-slim AS builder

# Install only the needed package globally
RUN npm install -g @playwright/mcp@latest


# ----------- Stage 2: Runtime Layer -----------
FROM node:20-slim

# Set working directory
WORKDIR /app

# Copy global package from builder stage
COPY --from=builder /usr/local /usr/local
COPY --from=builder /opt /opt
ENV PATH=/usr/local/bin:$PATH

# Port to expose
EXPOSE 8931

# Start the binary
CMD ["playwright-mcp", "--port", "8931"]
