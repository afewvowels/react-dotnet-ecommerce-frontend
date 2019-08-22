import React, { Component } from 'react';

import styled from 'styled-components';

const Title = styled.h1`
  font-size: 10rem;
`;

export default class Account extends Component {
  render() {
    return(
      <div className='account'>
        <Title>account</Title>
        <Title>account</Title>
        <Title>account</Title>
        <Title>account</Title>
        <Title>account</Title>
      </div>
    );
  }
}
