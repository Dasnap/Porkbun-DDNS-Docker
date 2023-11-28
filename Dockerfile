FROM python:3-alpine

WORKDIR /porkbun

COPY main.py main.py
COPY requirements.txt requirements.txt 

#installing pip (needed for requests)
RUN apk add py3-pip --no-cache

# installing curl to get used scripts from https://github.com/porkbundomains/porkbun-dynamic-dns-python
RUN apk add curl --no-cache
RUN curl https://raw.githubusercontent.com/Dasnap/Porkbun-Dynamic-DNS/main/porkbun-ddns.py -o porkbun-ddns.py
RUN curl https://raw.githubusercontent.com/Dasnap/Porkbun-Dynamic-DNS/main/config.json.example -o config.json
#removing curl to save space
RUN apk del curl

ENTRYPOINT ["python", "main.py"]