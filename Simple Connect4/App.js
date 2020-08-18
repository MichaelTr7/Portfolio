const {app,BrowserWindow,Menu} = require('electron')
const electron = require('electron')

// Function to create the main window
function createWindow(){

let Window_Properties = {
    height: 450,
    width: 500,
    resizable: false,
    fullscreenable: false,
    // tranparent: false,
    // vibrancy: 'light',
    webPreferences: {
      nodeIntegration: true,
      enableRemoteModule: true
    }
  }

const Main_Window = new BrowserWindow(Window_Properties);
Main_Window.loadFile('./View/Main_Panel.html')

// Main_Window.webContents.openDevTools();
// Building the menu bar
const menu = Menu.buildFromTemplate(template)
Menu.setApplicationMenu(menu)

}



// When the application is ready create the main window
app.whenReady().then(createWindow)


app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }

})

app.on('activate', () => {
  if (BrowserWindow.getAllWindows().length === 0) {
    createWindow()
  }
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
      { role: 'quit' },

    ]
  }] : []),
  // { role: 'fileMenu' }
   {
     label: 'Window',
     submenu: [
       isMac ? { role: 'close' } : { role: 'quit' },  { role: 'minimize' }
     ]
   }

]
