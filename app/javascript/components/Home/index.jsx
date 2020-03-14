import React, {Fragment} from 'react';

export default class Home extends React.Component {
  constructor(props) {
    super(props);
  }

  backToMain = () => {
    if (this.props.admin) {
      window.location = '/';
    }
  }

  render() {
    return (
      <div className="container">
        <hr/>
        <div style={{display: 'flex', justifyContent: 'space-between'}}>
          <span style={{color: 'white'}} onClick={() => this.backToMain()}>
            <i className="fa fa-euro" style={{fontSize: 3+'rem'}}></i>
            <span style={{fontSize: 1+'rem'}}>Bodia kurs</span>
          </span>
          <h3 style={{color: 'white'}}>
            <a href="tel:+900300400" style={{color: 'white'}}>+38 096 433 7090</a>
          </h3>
          <a style={{color: 'white', fontSize: 1.5+'rem'}} target='_blank' href="https://www.google.com.ua/maps/place/50%C2%B037'09.6%22N+27%C2%B009'30.4%22E/@50.619344,27.1578835,19z/data=!3m1!4b1!4m9!1m2!2m1!1z0L7QsdC80ZbQvSDQstCw0LvRjtGC!3m5!1s0x0:0x0!7e2!8m2!3d50.619344!4d27.1584322?hl=en&authuser=0">
            Карта <i className="fa fa-map"></i>
          </a>
        </div>
        <hr/>
        <table className='dark' style={{marginTop: 20 + 'px'}} style={{fontSize: 3+'rem'}}>
          <thead>
          <tr>
            <th><h1>Валюта</h1></th>
            <th><h1>Купівля</h1></th>
            <th><h1>Продаж</h1></th>
          </tr>
          </thead>
          <tbody>
          { this.props.currencies.map((currency) => {
            return (
              <tr key={currency.id}>
                <td><img className='currency-icon' src={`/images/${currency.name}.svg`} style={{height: 5+'rem'}}/>{currency.name}</td>
                <td>{currency.buy_price}</td>
                <td>{currency.sell_price}</td>
              </tr>
            )
          })}
          </tbody>
        </table>
        <hr/>
          <h3 style={{color: 'white'}}>
            Останнє оновлення курсу: {this.props.last_update}
          </h3>
        <hr/>
      </div>
    );
  }
}
