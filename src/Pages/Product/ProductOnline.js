import React, { Component } from 'react';
import ProductCard from '../../Components/ProductCard/ProductCard';

export default class Product extends Component {
  constructor(props) {
    super(props);
    this.state = {
      error: null,
      isLoaded: false,
      clothes: []
    };
  }

  componentDidMount() {
    fetch("https://keithbsmith.me/clothes.json")
    .then( response => response.json() )
    .then(
      (result) => {
        this.setState({
          isLoaded: true,
          clothes: result
        });
      },
      (error) => {
        this.setState({
          isLoaded: true,
          error
        });
      }
    )
  }

  render() {
    const {error, isLoaded, clothes} = this.state;

    if(error) {
      return(
        <div>
          <h1>Error in loading</h1>
          <h1>Error in loading</h1>
          <h1>Error in loading</h1>
          <h1>Error in loading</h1>
          <h1>Error in loading</h1>
          <h1>Error in loading</h1>
          <h1>Error in loading</h1>
          <h1>Error in loading</h1>
          <h1>Error in loading</h1>
          <h1>Error in loading</h1>
          <h1>Error in loading</h1>
          <h1>Error in loading</h1>
          <h1>Error in loading</h1>
        </div>
      );
    } else if (!isLoaded) {
      return(
        <div>
          <h1>Loading, please wait</h1>
          <h1>Loading, please wait</h1>
          <h1>Loading, please wait</h1>
          <h1>Loading, please wait</h1>
          <h1>Loading, please wait</h1>
          <h1>Loading, please wait</h1>
          <h1>Loading, please wait</h1>
          <h1>Loading, please wait</h1>
          <h1>Loading, please wait</h1>
        </div>
      );
    } else {
      return(
        <ol>
          {
            clothes.map(clothesItem => (
              <li key={clothesItem.fs_clothing_id}>
                <img src={clothesItem.clothing_photo} />
                <p>{clothesItem.clothing_title}</p>
                <p>{clothesItem.clothing_description_id}</p>
                <p>{clothesItem.clothing_price}</p>
              </li>
            ))
          }
        </ol>
      );
    }
  }
}
