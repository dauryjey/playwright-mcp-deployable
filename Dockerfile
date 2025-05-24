FROM node:slim

# Install only the package (not globally)
RUN npm install -D @playwright/mcp@latest

# Expose the port the app listens on
EXPOSE 8931

CMD ["npx", "@playwright/mcp", "--port", "8931"]