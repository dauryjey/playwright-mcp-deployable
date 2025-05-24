FROM node:slim

# Expose the port the app listens on
EXPOSE 8931

CMD ["npx", "@playwright/mcp", "--port", "8931"]