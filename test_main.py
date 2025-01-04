from fastapi.testclient import TestClient
from main import app
import nltk

nltk.download("punkt_tab", force=True)

client = TestClient(app)


def test_read_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Wikipedia API.  Call /search or /wiki"}


def test_read_phrase():
    response = client.get("/phrase/Barack Obama")
    assert response.status_code == 200
    assert response.json() == {
        "result": [
            "barack hussein obama ii",
            "august",
            "american lawyer",
            "44th president",
        ]
    }
