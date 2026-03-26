from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"message": "Привет, мир!"}

@app.get("/tasks")
def get_tasks():
    return [
        {"id": 1, "title": "Купить молоко", "is_done": False},
        {"id": 2, "title": "Сделать домашку", "is_done": False},
    ]

@app.get("/users")
def get_users():
    return [
        {"id": 1, "username": "alice"},
        {"id": 2, "username": "bob"},
        {"id": 3, "username": "charlie"},
    ]