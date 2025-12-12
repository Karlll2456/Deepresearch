# Setup Guide - Open Deep Research

This guide will help you get the Open Deep Research project up and running on your local machine.

## Prerequisites

- Node.js 18.17 or later
- pnpm (will be installed if not present)
- Git

## Quick Start

### 1. Install Dependencies

```bash
# Install pnpm if you don't have it
npm install -g pnpm

# Install project dependencies
pnpm install
```

### 2. Configure Environment Variables

A basic `.env` file has been created for you. However, for full functionality, you'll need to add your own API keys:

1. **OpenAI API Key** (Required for AI features)
   - Get your key at: https://platform.openai.com/account/api-keys
   - Update `OPENAI_API_KEY` in `.env`

2. **Firecrawl API Key** (Required for web research)
   - Get your key at: https://www.firecrawl.dev/
   - Update `FIRECRAWL_API_KEY` in `.env`

3. **Auth Secret** (Generate a secure random string)
   ```bash
   openssl rand -base64 32
   ```
   - Update `AUTH_SECRET` in `.env` with the generated value

4. **Database** (Optional for development)
   - For local development, the app can run without a database
   - For production, set up Vercel Postgres and update `POSTGRES_URL`

### 3. Run the Development Server

```bash
# Start the development server
pnpm dev
```

The application will be available at [http://localhost:3000](http://localhost:3000)

## Optional: Database Setup

If you want to use database features (chat history, user data):

1. Set up a PostgreSQL database (locally or using Vercel Postgres)
2. Update the `POSTGRES_URL` in `.env`
3. Run migrations:
   ```bash
   pnpm db:migrate
   ```

## Optional: Additional Services

- **Vercel Blob Storage**: For file uploads
- **Upstash Redis**: For rate limiting
- **TogetherAI**: Alternative AI provider

See `.env.example` for more details on these optional services.

## Building for Production

```bash
# Build the production version
pnpm build

# Start the production server
pnpm start
```

## Troubleshooting

### Missing API Keys
If you see errors about missing API keys, make sure you've updated the `.env` file with valid keys.

### Database Connection Issues
If you're not using a database, some features like chat history won't work, but the core AI functionality will still function.

### Port Already in Use
If port 3000 is already in use, you can specify a different port:
```bash
PORT=3001 pnpm dev
```

## Project Structure

- `/app` - Next.js 15 app router pages and API routes
- `/components` - React components
- `/lib` - Utility functions, AI configuration, database schema
- `/public` - Static assets
- `/hooks` - Custom React hooks

## Documentation

For more details, see:
- [README.md](./README.md) - Project overview and features
- [.env.example](./.env.example) - All available environment variables

## Need Help?

- Check the [GitHub Issues](https://github.com/Karlll2456/Deepresearch/issues)
- Review the original project: [Open Deep Research](https://github.com/nickscamara/open-deep-research)
