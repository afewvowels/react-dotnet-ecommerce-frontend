import React, { Component } from 'react';

import { Link } from 'react-router-dom';

import styled from 'styled-components';

import { FaRegArrowAltCircleRight, FaPhone, FaUser, FaHome } from 'react-icons/fa';

const Origin = styled.footer`
  height: auto;
  width: 100%;
  background-color: ${props => props.theme.primary};
  padding: 2rem 1rem;
  font-family: ${props => props.theme.fontBody};
  color: ${props => props.theme.fontLight};
  box-sizing: border-box;
`;

const Wrapper = styled.section`
  display: flex;
  align-items: flex-start;
  justify-content: space-around;
`;

const ColTitle = styled.h6`
  margin: 0 0 1.75rem 0;
  font-size: 1.25rem;
  font-family: ${props => props.theme.fontDisplay};
  position: relative;
  &:after {
    content: '';
    width: 90%;
    position: absolute;
    bottom: -.5rem;
    left: 0;
    height: 1px;
    background-color: ${props => props.theme.fontLight};
  }
`;

const Col1 = styled.div`
  width: 33%;
  padding: 0 1.5rem;
`;

const Col1List = styled.ul`
  margin: 0;
  padding: 0;
`;

const Col1ListItem = styled.li`
  list-style: none;
  margin-bottom: 0.5rem;
  display: flex;
  align-items: flex-start;
  justify-content: flex-start;
  .contact-icon {
    margin-right: 0.5rem;
  }
`;

const Col2 = styled.div`
  width: 33%;
  padding: 0 1.5rem;
`;

const Col2Item = styled.p`
  line-height: 1.75rem;
`;

const Col3 = styled.div`
  width: 33.333%;
  padding: 0 1.5rem;
`;

const Col3List = styled.ul`
  list-style: none;
  margin: 0;
  padding: 0;
`;

const Col3ListItem = styled.li`
  display: flex;
  align-items: center;
  justify-content: flex-start;
  margin-bottom: 0.5rem;
  .sitemap-icon {
    margin-right: 0.5rem;
  }

  .sitemap-link {
    color: ${props => props.theme.fontLight};
    text-decoration: none;
  }
`;

export default class Footer extends Component {
  render() {
    return(
      <Origin>
        <Wrapper>
          <Col1>
            <ColTitle>Contact</ColTitle>
            <Col1List>
              <Col1ListItem><FaUser className='contact-icon'/><span>Keith Smith</span></Col1ListItem>
              <Col1ListItem><FaHome className='contact-icon'/><span>3635 McConnell Rd.<br />Hermitage, PA 16148</span></Col1ListItem>
              <Col1ListItem><FaPhone className='contact-icon'/><span>724.456.7677</span></Col1ListItem>
            </Col1List>
          </Col1>
          {/*<VerticalDivider />*/}
          <Col2>
            <ColTitle>About</ColTitle>
            <Col2Item>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</Col2Item>
          </Col2>
          {/*<VerticalDivider />*/}
          <Col3>
            <ColTitle>Sitemap</ColTitle>
            <Col3List>
              <Col3ListItem><FaRegArrowAltCircleRight className='sitemap-icon'/><Link to={'/'} className='sitemap-link'>Home</Link></Col3ListItem>
              <Col3ListItem><FaRegArrowAltCircleRight className='sitemap-icon'/><Link to={'/categories'} className='sitemap-link'>Categories</Link></Col3ListItem>
              <Col3ListItem><FaRegArrowAltCircleRight className='sitemap-icon'/><Link to={'/cart'} className='sitemap-link'>Cart</Link></Col3ListItem>
              <Col3ListItem><FaRegArrowAltCircleRight className='sitemap-icon'/><Link to={'/account'} className='sitemap-link'>Account</Link></Col3ListItem>
            </Col3List>
          </Col3>
        </Wrapper>
      </Origin>
    );
  }
}
