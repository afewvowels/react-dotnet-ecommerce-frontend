import React, { Component } from 'react';
import Header from '../Header/Header';
import Footer from '../Footer/Footer';

import { Route } from 'react-router-dom';

import styled from 'styled-components';

import Home from '../Home/Home';
import Product from '../Product/Product';
import Cart from '../Cart/Cart';
import Checkout from '../Checkout/Checkout';
import Confirmation from '../Confirmation/Confirmation';
import Account from '../Account/Account';
import Categories from '../Categories/Categories';

const Origin = styled.div`
  display: grid;
  grid-template:
    "header" auto
    "content" 1fr
    "footer" auto
    / auto;
  min-height: 100vh;
`;

const StyledHeader = styled(Header)`
  grid-area: header;
`;

const StyledFooter = styled(Footer)`
  align-self: flex-end;
  grid-area: footer;
`;

const Wrapper = styled.div`
  grid-area: content;
`;

export default class Layout extends Component {
  render() {
    return(
      <Origin>
        <StyledHeader />
        <Wrapper>
          <Route exact path='/' component={Home} />
          <Route path='/product' component={Product} />
          <Route path='/cart' component={Cart} />
          <Route path='/checkout' component={Checkout} />
          <Route path='/confirmation' component={Confirmation} />
          <Route path='/account' component={Account} />
          <Route path='/categories' component={Categories} />
        </Wrapper>
        <StyledFooter />
      </Origin>
    );
  }
}
