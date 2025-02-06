import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import "@mantine/core/styles.css";
import { VisibilityProvider } from './providers/VisibilityProvider';
import App from './components/App';
import { MantineProvider } from "@mantine/core"
import { theme } from "./theme"
import { isEnvBrowser } from './utils/misc';

const root = document.getElementById("root")

if (isEnvBrowser()) {
  root!.style.backgroundImage = 'url("https://r2.fivemanage.com/image/4EcaVWw07AEJ")';
  root!.style.backgroundSize = "cover";
  root!.style.backgroundRepeat = "no-repeat";
  root!.style.backgroundPosition = "center";
}

ReactDOM.createRoot(root!).render(
  <React.StrictMode>
    <MantineProvider forceColorScheme='dark' theme={theme}>
      <VisibilityProvider>
        <App />
      </VisibilityProvider>
    </MantineProvider>
  </React.StrictMode>,
);
