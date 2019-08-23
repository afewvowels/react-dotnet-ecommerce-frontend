import React, { Component } from 'react';
import styled from 'styled-components';

import ProductCard from '../../Components/ProductCard/ProductCard';

import clothesData from './clothes.json';

const Origin = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 5rem 0;
  flex-wrap: wrap;
  &::after {
    content: "";
    width: 30rem;
    margin: 2rem;
    padding: 3rem;
  }
`;

export default class Product extends Component {
  constructor(props) {
    super(props);
    this.state = {
      clothes: clothesData
    };
  }

  render() {
  const {clothes} = this.state;
    return(
      <Origin>
        {
          clothes.map(clothesItem => (
            <ProductCard
              key={clothesItem.fs_clothing_id}
              image={clothesItem.clothing_photo}
              title={clothesItem.clothing_title}
              description={clothesItem.clothing_description_id}
              price={clothesItem.clothing_price}
              salePrice={clothesItem.clothing_sale_price}
            />
          ))
        }
      </Origin>
    );
  }
}
