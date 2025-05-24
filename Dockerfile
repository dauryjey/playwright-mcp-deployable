FROM node:slim

# Create non-root user and working directories
RUN apt-get update && \
    apt-get install -y wget gnupg ca-certificates fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 \
    libatk1.0-0 libcups2 libdbus-1-3 libgdk-pixbuf2.0-0 libnspr4 libnss3 libx11-xcb1 libxcomposite1 libxdamage1 \
    libxrandr2 xdg-utils libu2f-udev libvulkan1 && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m -s /bin/bash appuser

# Set working directory
WORKDIR /home/appuser/app

# Ensure user directories exist and are writable
RUN mkdir -p /home/appuser/app/user-data /home/appuser/app/output && \
    chown -R appuser:appuser /home/appuser/app

# Install chrome for playwright
RUN npx playwright install chrome

# Use non-root user
USER appuser

# Expose port
EXPOSE 8931

# Run command as appuser
CMD ["npx", "@playwright/mcp", "--port", "8931", "--user-data-dir", "/home/appuser/app/user-data", "--output-dir", "/home/appuser/app/output"]
