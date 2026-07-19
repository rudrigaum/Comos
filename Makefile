# Project Variables
PROJECT_NAME = Cosmos
SCHEME_NAME = Cosmos
TEST_SCHEME = Cosmos
DESTINATION = platform=iOS Simulator,name=iPhone 16 Pro,OS=latest

.PHONY: build test clean help

help:
	@echo "Available commands:"
	@echo "  make build  - Compile the project"
	@echo "  make test   - Run unit tests"
	@echo "  make clean  - Remove build artifacts"

build:
	xcodebuild build -project $(PROJECT_NAME).xcodeproj -scheme $(SCHEME_NAME) -destination '$(DESTINATION)'

test:
	xcodebuild test -project $(PROJECT_NAME).xcodeproj -scheme $(TEST_SCHEME) -destination '$(DESTINATION)'

clean:
	rm -rf build
	xcodebuild clean -project $(PROJECT_NAME).xcodeproj -scheme $(SCHEME_NAME)
