# Variables
PLATFORMS = linux/amd64,linux/arm64
TAG = quidryan/finkey
DEBUG = --debug

# Default target
all: build

# Build target
build:
	docker buildx build --platform $(PLATFORMS) $(DEBUG) --tag=$(TAG) .

deploy:
	fly deploy --local-only

# Clean target (optional: if cleanup is needed)
clean:
	@echo "No cleaning process defined for this Makefile."