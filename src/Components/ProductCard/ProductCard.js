import React, { Component } from 'react';
import styled from 'styled-components';

const Origin = styled.div`
  width: 30rem;
  height: 40rem;
  border-radius: 3rem;
  padding: 3rem;
  margin: 2rem;
  box-shadow: 0px 0px 1.75rem rgba(15,15,15,0.15);
  transition: all 0.5s ease-in-out;
  &:hover {
    transform: scale(1.05);
  }
  img {
    width: 100%;
    height: auto;
    margin: 0 0 1rem 0;
    border-radius: 2rem;
  }
  &::after {
    box-shadow: 0px 0px 3.75rem rgba(15,15,15,0.05);
    position: absolute;
    top: -2rem;
    left: -2rem;
    opacity: 0;
    transition: all 1s ease;
    width: 30rem;
    height: 40rem;
    margin: 2rem;
    padding: 3rem;
    border-radius: 3rem;
    content: "";
  }
  &:hover::after {
    opacity: 1;
  }
  h1 {
    font-family: ${props => props.theme.fontDisplay};
    margin: 0 0 1rem 0;
    padding: 0;
  }
  p {
    font-family: ${props => props.theme.fontBody};
    margin: 0 0 1rem 0;
    padding: 0;
  }
`;

const PriceStrikeThrough = styled.p`
  text-decoration: line-through;
`;

const PriceSale = styled.p`
  color: red;
`;

export default class ProductCard extends Component {
  render() {

    if(this.props.price > this.props.salePrice) {
      return(
        <Origin>
          <img src={this.props.image} />
          <h1>{this.props.title}</h1>
          <p>{this.props.description}</p>
          <PriceStrikeThrough>{this.props.price}</PriceStrikeThrough>
          <PriceSale>{this.props.salePrice}</PriceSale>
        </Origin>
      );
    } else {
      return(
        <Origin>
          <img src={this.props.image} />
          <h1>{this.props.title}</h1>
          <p>{this.props.description}</p>
          <p>{this.props.price}</p>
        </Origin>
      );
    }
  }
}
