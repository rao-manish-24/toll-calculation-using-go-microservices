gate:
	@go build -o bin/gate gateway/main.go
	@./bin/gate

obu:
	@go build -o bin/obu obu/main.go
	@./bin/obu

receiver: 
	@go build -o bin/receiver ./data_receiver
	@./bin/receiver
	
calculator: 
	@go build -o bin/calculator ./distance_calculator
	@./bin/calculator

aggregator: 
	@go build -o bin/aggregator ./aggregator
	@./bin/aggregator

run proto:
	../prometheus/prometheus --config.file=./.config/prometheus.yml
	
proto:
	protoc --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative types/ptypes.proto

grafana:
	sudo systemctl start grafana-server


.PHONY: obu invoicer aggregator calculator