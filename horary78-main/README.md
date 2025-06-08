# Horary App Docker Instructions

This repository contains the backend and frontend for the Horary astrology application. The project structure was simplified so the backend now lives in the `backend/` directory and the frontend in `frontend/`. A `Dockerfile` is provided to build a container that bundles both parts and serves the API via Gunicorn.

## Build the Image

From the repository root run:

```bash
docker build -t horary-app .
```

### Node Setup for the Frontend

Install Node.js and npm on your host machine if you haven't already. On Ubuntu-based systems you can run:

```bash
sudo apt-get update && sudo apt-get install -y nodejs npm
```

Then install the project dependencies inside the `frontend/` directory:

```bash
cd frontend
npm install
```

Before packaging the application or running the Electron version, build the production assets:

```bash
npm run build
```

## Run the Container

After building the image, start the application with:

```bash
docker run -p 5000:5000 horary-app
```

The API will be available on `http://localhost:5000`.

## Windows Packaging

If you want to distribute the application through the Microsoft Store you can
wrap the backend executable and built frontend into an `.appx` package.

1. **Build the executable**

   Use PyInstaller to generate a standalone binary:

   ```bash
   pyinstaller --onefile backend/app.py
   ```

   The resulting `app.exe` will be placed in the `dist/` directory.

2. **Create the `.appx` package**

   After building the frontend (e.g. `npm run build`), use Microsoft's MSIX
   Packaging Tool or `makeappx.exe` to combine `dist/app.exe` and the frontend
   `dist/` folder into a single `.appx` file.

3. **Sign and upload**

   Sign the package with your code signing certificate and submit it to the
   Microsoft Store for distribution.
