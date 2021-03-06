import React from 'react';

import { Router } from 'react-router-dom';

import { createBrowserHistory } from 'history';

import { createGlobalStyle } from 'styled-components';

import Layout from './Pages/Layout/Layout';

const GlobalStyle = createGlobalStyle`
  body, html {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    overscroll-behavior: none;
  }
`;

const customHistory = createBrowserHistory();

function App() {
  return (
    <Router history={customHistory}>
      <GlobalStyle />
      <Layout />
    </Router>
  );
}

export default App;
