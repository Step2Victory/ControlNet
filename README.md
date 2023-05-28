# ControlNet

Разворачивает приложение `gradio_canny2image.py` из репозитория [lllyasviel/ControlNet](https://github.com/lllyasviel/ControlNet) в Docker.

## Инструкция по установке

1) Сделать git clone репозитория: 
```bash 
git clone https://github.com/Step2Victory/ControlNet.git
```
2) Зайти в папку проекта:
```bash
cd ControlNet/
```
4) [Скачать веса модели](https://huggingface.co/lllyasviel/ControlNet/blob/main/models/control_sd15_canny.pth)  и поместить в папку `src/models/`.
5) Собрать докер:
```bash 
docker build -t controlnet .
```
5) Запустить докер: 
```bash 
docker run --gpus=all -it -p 7860:7860 controlnet
```
6) Перейти на [localhost:7860](http://localhost:7860/).
