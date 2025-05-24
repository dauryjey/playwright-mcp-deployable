FROM mcr.microsoft.com/playwright/mcp

# Expose the port the app listens on
EXPOSE 8931

# Run MCP / SSE
CMD ["npx", "@playwright/mcp", "--isolated", "--no-sandbox", "--port", "8931"]