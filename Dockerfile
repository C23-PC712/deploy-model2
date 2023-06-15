# Use the official TensorFlow Serving runtime as the base image
FROM tensorflow/serving:2.12.1

# Set the model name and version
ENV MODEL_NAME text-detection
ENV MODEL_VERSION 1

# Copy the model files into the container
COPY ./models /models/${MODEL_NAME}/${MODEL_VERSION}

# Set the model base path environment variable
ENV MODEL_BASE_PATH /models

# Set the model name and version environment variables
ENV MODEL_NAME ${MODEL_NAME}
ENV MODEL_VERSION ${MODEL_VERSION}

# Expose the REST API port
EXPOSE 8501

# Start TensorFlow Serving when the container launches
CMD tensorflow_model_server \
    --port=8501 \
    --rest_api_port=8501 \
    --model_name=${MODEL_NAME} \
    --model_base_path=${MODEL_BASE_PATH}/${MODEL_NAME}