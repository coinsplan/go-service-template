run:
	go run cmd/app/main.go

docker-image:
	docker build -t coinsplan-go-service-template:latest .