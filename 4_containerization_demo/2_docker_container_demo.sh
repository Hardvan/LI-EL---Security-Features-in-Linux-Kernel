# Run: sudo ./2_docker_container_demo.sh
# Description:
#   This script automates the process of building a Docker image,
#   running a container, executing a command inside it, and cleaning up.
#   Emoji-enhanced messages are used to explain each step.

set -e # Exit immediately if a command exits with a non-zero status

# --------------------------------------------------
# Step 1: Check Docker installation
# --------------------------------------------------
echo -e "✅ [Step 1] Docker is installed: $(docker --version)\n"

# --------------------------------------------------
# Step 2: Prepare Docker build context
# --------------------------------------------------
BUILD_DIR="/tmp/docker-demo"
IMAGE_NAME="docker-demo-image"
CONTAINER_NAME="docker-demo-container"

echo -e "🗂️ [Step 2] Preparing Docker build context in ${BUILD_DIR}..."
mkdir -p "${BUILD_DIR}"
cat > "${BUILD_DIR}/Dockerfile" <<'EOF'
# Use a minimal base image
FROM alpine:latest
# Set an environment variable for demonstration
ENV DEMO_MSG="Hello from your Docker container!"
# Default command: print hostname and then sleep indefinitely
CMD echo "📢 Container Hostname: $(hostname)" && echo "$DEMO_MSG" && sleep infinity
EOF
echo -e "✅ [Step 2] Dockerfile created in ${BUILD_DIR}.\n"

# --------------------------------------------------
# Step 3: Build the Docker image
# --------------------------------------------------
echo -e "🔨 [Step 3] Building Docker image '${IMAGE_NAME}'..."
docker build -t "${IMAGE_NAME}" "${BUILD_DIR}"
echo -e "✅ [Step 3] Docker image '${IMAGE_NAME}' built successfully.\n"

# --------------------------------------------------
# Step 4: Run a Docker container
# --------------------------------------------------
echo -e "🚀 [Step 4] Running Docker container '${CONTAINER_NAME}'..."
# Check if a container with the same name already exists and remove it
if [ "$(docker ps -aq -f name=^${CONTAINER_NAME}$)" ]; then
    echo -e "🗑️ [Step 4] Removing existing container '${CONTAINER_NAME}'..."
    docker rm -f "${CONTAINER_NAME}" >/dev/null 2>&1
fi
# Run the container in detached mode so we can exec commands into it
docker run --name "${CONTAINER_NAME}" -d "${IMAGE_NAME}"
echo -e "✅ [Step 4] Container '${CONTAINER_NAME}' is running.\n"

# --------------------------------------------------
# Step 5: Execute a command inside the container
# --------------------------------------------------
echo -e "🔍 [Step 5] Executing command inside the container to display its hostname and message..."
docker exec "${CONTAINER_NAME}" sh -c 'echo "Inside Container:"; hostname; echo "Message:"; echo "$DEMO_MSG"'
echo -e "✅ [Step 5] Command executed successfully.\n"

# --------------------------------------------------
# Step 6: Clean up: Stop and remove the container, remove the image and build context
# --------------------------------------------------
echo -e "🧹 [Step 6] Cleaning up..."
echo -e "👉 Stopping and removing container '${CONTAINER_NAME}'..."
docker stop "${CONTAINER_NAME}" >/dev/null
docker rm "${CONTAINER_NAME}" >/dev/null
echo -e "👉 Removing Docker image '${IMAGE_NAME}'..."
docker rmi "${IMAGE_NAME}" >/dev/null
echo -e "👉 Removing temporary build directory '${BUILD_DIR}'..."
rm -rf "${BUILD_DIR}"
echo -e "✅ [Step 6] Clean up complete.\n"

echo -e "🎉 [Complete] Docker container demo finished successfully!\n"
