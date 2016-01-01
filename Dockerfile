FROM python:3-slim

WORKDIR /usr/src/app

# leverage caching for nltk installs
RUN pip install nltk
RUN python -c "import nltk; nltk.download(['stopwords', 'punkt'])"

COPY requirements.txt /usr/src/app/
RUN pip install -r requirements.txt

COPY . /usr/src/app
EXPOSE 80
CMD ["gunicorn", "summarize-demo:app", "-b", "0.0.0.0:80", "--log-file", "-"]
