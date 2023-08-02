# --- Build Stage 1: Node.js Frontend ---
FROM node:16 AS frontend

WORKDIR /app
COPY app/ ./

WORKDIR /app/frontend
RUN npm install
RUN npm run build

# --- Build Stage 2: Python Backend ---
FROM python:3.9 AS backend

WORKDIR /app
COPY app/backend/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install gunicorn

COPY app/backend .
COPY --from=frontend /app/backend/static ./static

ENV PORT 80
EXPOSE 80

ENTRYPOINT ["python"]
CMD ["-m", "gunicorn", "app:app"]