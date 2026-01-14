# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Ruby on Rails 7.1.6 API-only application using PostgreSQL. It serves as the backend API for Flowdesk (with a separate JavaScript frontend).

- **Ruby version**: 3.3.5
- **Rails version**: 7.1.6
- **Database**: PostgreSQL
- **Web server**: Puma

## Common Commands

```bash
# Setup
bin/setup                    # Full development setup (gems, database)
bundle install               # Install dependencies only

# Database
bin/rails db:create          # Create databases
bin/rails db:migrate         # Run migrations
bin/rails db:seed            # Seed data
bin/rails db:prepare         # Create/migrate as needed

# Development
bin/rails server             # Start server (port 3000)
bin/rails console            # Rails console

# Testing
bin/rails test               # Run all tests
bin/rails test test/models   # Run model tests only
bin/rails test test/models/user_test.rb            # Run single test file
bin/rails test test/models/user_test.rb:10         # Run single test at line 10

# Docker
docker build -t api-flowdesk .
docker run -p 3000:3000 api-flowdesk
```

## Architecture

- **API-only mode**: Configured with `config.api_only = true` - no views, asset pipeline, or browser-specific middleware
- **Routes**: Defined in `config/routes.rb` - currently only health check at `/up`
- **CORS**: `rack-cors` gem included for cross-origin requests from the JS frontend
- **ActionCable**: WebSocket infrastructure available in `app/channels/`
- **Background jobs**: ActiveJob infrastructure available in `app/jobs/`

## Project Structure

```
app/
├── channels/     # ActionCable WebSocket channels
├── controllers/  # API controllers (inherit from ApplicationController)
├── jobs/         # Background jobs
├── mailers/      # Email logic
├── models/       # ActiveRecord models (inherit from ApplicationRecord)
config/
├── environments/ # Environment-specific configuration
├── initializers/ # Startup configuration (CORS, etc.)
├── routes.rb     # URL routing
db/
├── migrate/      # Database migrations
├── seeds.rb      # Seed data
test/             # Minitest test suite
```
