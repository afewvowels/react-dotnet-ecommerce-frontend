import React from 'react';
import ReactDOM from 'react-dom';
import App from './App/App';
import * as serviceWorker from './serviceWorker';
import { ThemeProvider } from 'styled-components';

const theme = {
  primary: "#c62828",
  primaryLight: "#ff5f52",
  primaryDark: "#8e0000",

  secondary: "#b0bec5",
  secondaryLight: "#e2f1f8",
  secondaryDark: "#808e95",

  fontLight: "#fbfbfb",
  fontDark: "#0a0a0a",

  fontBody: "'Livvic', sans-serif",
  fontDisplay: "'Lexend Deca', sans-serif"
};

ReactDOM.render(
  <ThemeProvider theme={theme}>
    <App />
  </ThemeProvider>
  , document.getElementById('root'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
