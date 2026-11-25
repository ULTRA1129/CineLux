FROM node:20-slim

WORKDIR /app

# Copy backend dependencies and install
COPY backend/package*.json ./backend/
RUN cd backend && npm ci --omit=dev

# Copy backend and frontend source code
COPY backend ./backend
COPY frontend ./frontend

WORKDIR /app/backend

ENV NODE_ENV=production
EXPOSE 7860

CMD ["sh", "-c", "npm run migrate && npm run seed && npm start"]