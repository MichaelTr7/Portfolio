const { app, BrowserWindow,Menu, ipcMain} = require('electron')

function createWindow () {
  // Create the browser window.
  const win = new BrowserWindow({
    width: 300,
    height: 300,
    resizable: false,
    titleBarStyle: 'hiddenInset',
    fullscreen: false,
    frame: false,
    transparent:true,
    webPreferences: {
      nodeIntegration: true,
      enableRemoteModule: true
    }
  })

  // and load the index.html of the app.
  win.loadFile('./View/Selection_Panel.html')
  // Building the menu bar
  // Building the menu bar
  const menu = Menu.buildFromTemplate(template)
  Menu.setApplicationMenu(menu)
  // Open the DevTools.
  // win.webContents.openDevTools()
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.whenReady().then(createWindow)

// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})

app.on('activate', () => {
  // On macOS it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (BrowserWindow.getAllWindows().length === 0) {
    createWindow()
  }
})


ipcMain.on('ondragstart', (event, filePath) => {
  console.log("File");
  event.sender.startDrag({
    file: filePath,
    icon: './View/Controller/Model/App_Icon_Image_Resized.png'
  })
})
// In this file you can include the rest of your app's specific main process
// code. You can also put them in separate files and require them here.


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
      { role: 'quit' },

    ]
  }] : []),


]
