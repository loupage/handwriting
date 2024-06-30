FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/loupage/handwriting.git .

RUN pip3 install -r requirements.txt

EXPOSE 8501

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=6 CMD curl --fail http://localhost:8501/_stcore/health || exit 1


ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]