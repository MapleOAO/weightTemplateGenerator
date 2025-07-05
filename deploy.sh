#!/bin/bash

# 检查是否提供了端口参数
if [ $# -eq 0 ]; then
    echo "请指定端口号，例如: ./deploy.sh 3000"
    exit 1
fi

PORT=$1
IMAGE_NAME="logistics-pricing-editor"
CONTAINER_NAME="logistics-pricing-editor"

echo "开始部署物流计费规则编辑器..."

# 构建 Docker 镜像
echo "构建 Docker 镜像..."
docker build -t $IMAGE_NAME .

# 检查是否有同名容器在运行，如果有则停止并删除
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "停止并删除已存在的容器..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# 运行新容器
echo "启动新容器，端口映射到 $PORT..."
docker run -d \
    --name $CONTAINER_NAME \
    -p $PORT:80 \
    $IMAGE_NAME

echo "部署完成！"
echo "访问地址: http://localhost:$PORT" 