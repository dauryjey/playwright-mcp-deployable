# Start from the official Playwright MCP image
FROM mcr.microsoft.com/playwright/mcp


CMD ["--port=8931", \
     "--user-data-dir=/ms-playwright/mcp-profile", \
     "--no-sandbox", \
     "--headless"]