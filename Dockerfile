FROM node:24-alpine AS builder

WORKDIR /app

COPY . .

RUN npm install --frozen-lockfile

RUN npm run turbo-build

FROM node:24-alpine AS runner 

WORKDIR /app

COPY --from=builder /app/dist dist

CMD ["node", "dist/index.js"] 
