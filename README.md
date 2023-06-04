# ControlNet

Проверяет репродуцируемость проекта из репозитория [lllyasviel/ControlNet](https://github.com/lllyasviel/ControlNet) в Docker.

## Технические требования
1) Видеокарта с поддержкой NVidia Cuda.
2) Объем видеопамяти 8гб+.

## Инструкция по установке

1) Сделать git clone репозитория: 
```bash 
git clone https://github.com/Step2Victory/ControlNet.git
```
2) Зайти в папку проекта:
```bash
cd ControlNet/
```
3) Собрать докер:
```bash 
docker build -t controlnet .
```
4) Запустить докер: 
```bash 
docker run -it -v ${pwd}/test:/ControlNet-main/test --gpus=all controlnet
```
