#!/bin/bash
# 镜像瘦身，/app/libs 挂载volume

app_root=$(pwd)

# 从.env文件中加载环境变量
env_path=${app_root}/.env
echo "env_path:${env_path}"
if [ -f ${app_root}/.env ]; then
  source ${app_root}/.env
  echo "ENV_TYPE:$ENV_TYPE"
fi
# 根据ENV_TYPE的值来设置端口号

case "$ENV_TYPE" in
  0)
    PORT=8860
    ;;
  1)
    PORT=8861
    ;;
  2)
    PORT=8862
    ;;
  *)
    echo "未设置有效的ENV_TYPE值或ENV_TYPE值无效"
    exit 1
    ;;
esac
#
echo "使用的端口号是：$PORT"
export WEB_APP_PORT=$PORT
export WEBUI_PORT=$PORT

echo "------build and run"
#docker compose --profile download up --build
docker compose --profile download up --build -d

echo "------build and run download end"
# wait until its done, then:
#docker compose --profile [ui] up --build
#docker compose --profile auto up --build
docker compose --profile auto up --build -d
#docker compose --profile auto up --build -d --force-recreate
# where [ui] is one of: invoke | auto | auto-cpu | comfy | comfy-cpu
echo "------build and run auto end"
