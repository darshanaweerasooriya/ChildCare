from fastapi import FastAPI, File, UploadFile
import uvicorn
import numpy as np
from io import BytesIO
from PIL import Image
import tensorflow as tf

app = FastAPI()

MODEL = tf.keras.models.load_model("../savedmodels/2")
CLASS_NAME = ['1. Eczema 1677', '10. Warts Molluscum and other Viral Infections - 2103', '2. Melanoma 15.75k',
              '3. Atopic Dermatitis - 1.25k',
              '5. Melanocytic Nevi (NV) - 7970', 'BA-impetigo', 'Gianotti-Crosti syndrome',
              'Rashes in systemic diseases', 'VI-chickenpox', 'Vascular malformation']


@app.get("/ping")
async def ping():
    return "Hello I am "


def read_file_as_image(data) -> np.ndarray:
    image = np.array(Image.open(BytesIO(data)))
    return image


@app.post("/predict")
async def predict(
        file: UploadFile = File(...)
):
    image = read_file_as_image(await file.read())
    img_batch = np.expand_dims(image, 0)

    predictions = MODEL.predict(img_batch)
    predicted_class = CLASS_NAME[np.argmax(predictions[0])]

    confident = np.max(predictions[0])
    return {
        'class': predicted_class,
        'confidence': float(confident)
    }


if __name__ == "__main__":
    uvicorn.run(app, host='localhost', port=8000)
