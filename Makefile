install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt
post-install:
	python -m textblob.download_corpora
format:
	black *.py mylib/*.py
lint:
	pylint --disable=R,C *.py mylib/*.py
test:
	python -m pytest -vv --cov=mylib --cov=main test_*.py
build:
	docker build -t deploy-fastapi .
run:
	docker run -p 127.0.0.1:8080:8080 f24936e79b1c
deploy:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 135808939327.dkr.ecr.us-east-1.amazonaws.com
	docker build -t fastapi-1232 .
	docker tag fastapi-1232:latest 135808939327.dkr.ecr.us-east-1.amazonaws.com/fastapi-1232:latest
	docker push 135808939327.dkr.ecr.us-east-1.amazonaws.com/fastapi-1232:latest
all:
	install post-install lint test deploy