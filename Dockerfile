FROM node:24-alpine AS builder

ARG TURBO_API
ARG TURBO_TEAM
ARG TURBO_TOKEN

WORKDIR /app

COPY . .

RUN npm install --frozen-lockfile

RUN npm run turbo-build

FROM node:24-alpine AS runner 

WORKDIR /app

COPY --from=builder /app/dist dist

CMD ["node", "dist/index.js"] 
