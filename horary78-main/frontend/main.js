const { app, BrowserWindow } = require('electron');
const path = require('path');
const { spawn } = require('child_process');

function createWindow() {
  const win = new BrowserWindow({ width: 800, height: 600 });
  win.loadFile(path.join(__dirname, 'dist/index.html'));
}

app.whenReady().then(() => {
  spawn('python', ['../backend/app.py'], { stdio: 'inherit' });
  createWindow();
});
