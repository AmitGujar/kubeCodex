# Use the Confluent Kafka Connect image as the base image
FROM confluentinc/cp-server-connect:7.1.1

# Switch to the root user
USER root

# Add any additional commands or configurations here
# For example, installing additional packages

# Set the working directory
WORKDIR /root

# Copy any necessary files into the image
COPY . /root

# Set the default command to run when the container starts
CMD ["bash"]
