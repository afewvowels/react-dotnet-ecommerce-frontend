import React, { Component } from 'react';

import { Link } from 'react-router-dom';

import styled from 'styled-components';


const Origin = styled.header`
  height: 8rem;
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: ${props => props.theme.primary};
  margin: 0;
  padding: 0;
  color: ${props => props.theme.fontLight};
`;

const Branding = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: ${props => props.theme.fontDisplay};
`;

const BrandingLogo = styled.div`
  font-size: 4.2rem;
  border-radius: 50%;
  color: ${props => props.theme.primary};
  background-color: ${props => props.theme.fontLight};
  width: 5rem;
  height: 5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 1rem;
`;

const BrandingTitle = styled.h1`
  font-size: 3rem;
`;

const Navigation = styled.nav`
  font-family: ${props => props.theme.fontBody};
  margin-right: 1rem;
`;

const NavigationUl = styled.ul`
  list-style: none;
  display: flex;
  align-items: center;
  justify-content: center;
`;

const NavigationUlItem = styled.li`
  padding: 0rem 1rem;
  font-size: 1.25rem;
  cursor: pointer;
`;

const StyledLink = styled(Link)`
  color: ${props => props.theme.fontLight};
  text-decoration: none;
`;


export default class Header extends Component {
  render() {
    return(
      <Origin>
        <Branding>
          <BrandingLogo>F</BrandingLogo>
          <BrandingTitle>Flash Store</BrandingTitle>
        </Branding>
        <Navigation>
          <NavigationUl>
            <NavigationUlItem><StyledLink to={'/'}>Home</StyledLink></NavigationUlItem>
            <NavigationUlItem><StyledLink to={'/product'}>Products</StyledLink></NavigationUlItem>
            <NavigationUlItem><StyledLink to={'/categories'}>Categories</StyledLink></NavigationUlItem>
            <NavigationUlItem><StyledLink to={'/cart'}>Cart</StyledLink></NavigationUlItem>
            <NavigationUlItem><StyledLink to={'/account'}>Account</StyledLink></NavigationUlItem>
          </NavigationUl>
        </Navigation>
      </Origin>
    );
  }
}
