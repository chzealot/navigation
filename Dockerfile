FROM node:18-alpine AS builder

WORKDIR /work
COPY . /work

RUN npm install -g pnpm && pnpm install && pnpm build && ls /work/dist

From nginx

COPY --from=builder work/dist /usr/share/nginx/html/

# 暴露容器的80端口，允许外部访问
EXPOSE 80

# 容器启动时运行的命令
CMD ["nginx", "-g", "daemon off;"]
