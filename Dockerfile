FROM nginx:alpine

# 复制网站文件到容器中
COPY . /usr/share/nginx/html/

# 暴露端口（实际端口会在运行时通过 -p 参数映射）
EXPOSE 80

# 启动 nginx
CMD ["nginx", "-g", "daemon off;"] 