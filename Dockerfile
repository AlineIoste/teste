FROM python:3.10

# Instalar dependências
RUN apt-get update && apt-get install -y \
    git \
    git-lfs \
    ffmpeg \
    libsm6 \
    libxext6 \
    cmake \
    rsync \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/* \
    && git lfs install

WORKDIR /home/user/app

# Instalar dependências de Python
RUN pip install --no-cache-dir pip==22.3.1 && \
    pip install --no-cache-dir \
    datasets \
    "huggingface-hub>=0.19" \
    "hf-transfer>=0.1.4" \
    "protobuf<4" \
    "click<8.1" \
    "pydantic~=1.0"

# Copiar o script de download
COPY download_so.py /home/user/app/download_so.py

# Executar o script de download
RUN python /home/user/app/download_so.py

# Instalar as dependências do requirements.txt
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Executar a aplicação
COPY . /home/user/app
CMD ["python", "example_front_end.py"]
