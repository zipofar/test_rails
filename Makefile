docker-build:
	docker build -t zipofar/uffizzi_test_rails_simple:latest .

docker-push:
	docker push zipofar/uffizzi_test_rails_simple:latest
