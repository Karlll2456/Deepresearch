#!/bin/bash

# Open Deep Research - Quick Start Script
# This script helps you get the project running quickly

set -e

echo "================================================"
echo "Open Deep Research - Quick Start"
echo "================================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo -e "${RED}Error: Node.js is not installed.${NC}"
    echo "Please install Node.js 18.17 or later from https://nodejs.org/"
    exit 1
fi

echo -e "${GREEN}✓ Node.js $(node --version) detected${NC}"

# Check if pnpm is installed
if ! command -v pnpm &> /dev/null; then
    echo -e "${YELLOW}! pnpm not found. Installing pnpm...${NC}"
    npm install -g pnpm
    echo -e "${GREEN}✓ pnpm installed successfully${NC}"
else
    echo -e "${GREEN}✓ pnpm $(pnpm --version) detected${NC}"
fi

# Install dependencies if node_modules doesn't exist
if [ ! -d "node_modules" ]; then
    echo ""
    echo -e "${YELLOW}Installing dependencies...${NC}"
    pnpm install
    echo -e "${GREEN}✓ Dependencies installed${NC}"
else
    echo -e "${GREEN}✓ Dependencies already installed${NC}"
fi

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo ""
    echo -e "${YELLOW}! No .env file found${NC}"
    echo "Creating a basic .env file from .env.example..."
    cp .env.example .env
    echo -e "${YELLOW}⚠ WARNING: Please update the API keys in .env file before running the app${NC}"
    echo "  Required:"
    echo "    - OPENAI_API_KEY"
    echo "    - FIRECRAWL_API_KEY"
    echo "    - AUTH_SECRET (generate with: openssl rand -base64 32)"
else
    echo -e "${GREEN}✓ .env file exists${NC}"
fi

# Check if build exists
echo ""
if [ ! -d ".next" ]; then
    echo -e "${YELLOW}Building the project for the first time...${NC}"
    pnpm build
    echo -e "${GREEN}✓ Build completed${NC}"
else
    echo -e "${GREEN}✓ Build directory exists${NC}"
fi

echo ""
echo "================================================"
echo -e "${GREEN}Setup Complete!${NC}"
echo "================================================"
echo ""
echo "To start the development server:"
echo -e "${GREEN}  pnpm dev${NC}"
echo ""
echo "The app will be available at:"
echo -e "${GREEN}  http://localhost:3000${NC}"
echo ""
echo "For more information, see SETUP.md"
echo ""
