// Modules to control application life and create native browser window
const electron = require('electron')
const {app, BrowserWindow, Menu} = require('electron')
const fs = require('fs');
const path = require('path')
const nativeImage = require('electron').nativeImage;
var image = nativeImage.createFromPath(__dirname + '/public/img/Icon1024.png');

image.setTemplateImage(true);


// Function for creating the main window
function createWindow () {
  const display = electron.screen.getPrimaryDisplay()
  const Screen_Size = display.workAreaSize

  const mainWindow = new BrowserWindow({
      x: 0,
      y: Screen_Size.height,
      height: 350,
      width: Screen_Size.width,
      frame: false,
      resizable: false,
      transparent:true,
      hasShadow: true,
      webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      nodeIntegration: true,
      enableRemoteModule: true
    }
  })
  mainWindow.loadFile('App.html');
  // mainWindow.webContents.openDevTools()
}

// Function for creating the styles card panel
function Create_Style_Panel(){
  const display = electron.screen.getPrimaryDisplay()
  const Screen_Size = display.workAreaSize

  var Adjustments_Window = new BrowserWindow({
      x: 0,
      y: 0,
      height: 300,
      width: Screen_Size.width,
      titleBarStyle: 'hiddenInset',
      transparent: true,
      resizable: false,
      webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      nodeIntegration: true,
      enableRemoteModule: true
    }
  })

  Adjustments_Window.loadFile('Adjustment_Panel.html');
  // Adjustments_Window.webContents.openDevTools()

}

//Calling when ElectronJS is ready
app.whenReady().then(() => {

  // Creating the main window with the visualizer
  createWindow();

  // Building the menu bar
  const menu = Menu.buildFromTemplate(template)
  Menu.setApplicationMenu(menu)

  // On MacOS create a new window when dock icon is pressed if no other active windows
  app.on('activate', function () {
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })

})

// On MacOS keep application active until explicitly quit
app.on('window-all-closed', function () {
  if (process.platform !== 'darwin') app.quit()
})

// MacOS menu bar template
const isMac = process.platform === 'darwin'

const template = [
  // { role: 'appMenu' }
  ...(isMac ? [{
    label: app.name,
    submenu: [
      { role: 'about' },
      { role: 'hide' },
      { role: 'hideothers' },
      { role: 'unhide' },
      { type: 'separator' },
      { role: 'quit' }
    ]
  }] : []),

// Adjustment menu
    {
    label: 'Adjustments',
    submenu: [{
        label: 'Style',
        accelerator: 'CmdOrCtrl+S',
        click() {Create_Style_Panel();}
        }]
    },

    {
    role: 'help',
    submenu: [
      {
        label: 'Learn More',
        click: async () => {
          const { shell } = require('electron')
          await shell.openExternal('https://electronjs.org')
        }
      }]
    }
]
