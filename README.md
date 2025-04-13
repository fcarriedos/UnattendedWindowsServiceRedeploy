# UnattendedWindowsServiceRedeploy
Simple script to automate redeploying dev versions of your app to your Windows Server

# Usage

```
PS1> .\ReDeploy.ps1 <YOUR_WINDOWS_SERVER_HOSTNAME> <YOUR_WINDOWS_SERVICE_NAME>
```

# Configure it
The only configuration needed is the path to the bundle you are deploying in your local and the path where the bundle needs to be copied within the server in line #16:

```powershell
Copy-Item -Path <\LOCAL\PATH\TO\YOUR\BUNDLE.ZIP> -Destination "\\$server\c$\REMOTE\PATH\TO\COPY\YOUR\BUNDLE.ZIP"
```
