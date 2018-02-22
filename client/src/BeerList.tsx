import * as React from 'react';
import GiphyImage from './GiphyImage';
import './css/bootstrap.css';

class BeerList extends React.Component<{}, any> {

    constructor(context: any) {
        super(context);

        this.state = {
            beers : [],
            isLoading : false
        };

    }

    getGoodBeers() {
        fetch('http://localhost:9000/good-beers')
            .then(response => response.json())
            .then(data => this.setState({beers: data, isLoading: false}));
    }

    getAllBeers() {
        fetch('http://localhost:9000/beers')
            .then(response => response.json())
            .then(data => this.setState({beers: data, isLoading: false}));
    }

    componentDidMount() {
        this.setState({isLoading: true});

        this.getAllBeers();
    }

    render() {
        const {beers, isLoading } = this.state;

        if (isLoading) {
            return <p>Loading...</p>;
        }

        return (
            <div>
                <h2>Beer List</h2>
                <div>
                    <button onClick={(e) => this.getAllBeers()} className="btn btn-outline-primary">Just beers</button>
                    <button onClick={(e) => this.getGoodBeers()}className="btn btn-outline-primary">Good beers</button>
                </div>
                {beers.map((beer: any) =>
                    <div key={beer.id}>
                    {beer.name}<br/>
                       <GiphyImage name={beer.name}/>
                    </div>
                )}
            </div>
        );
    }
}

export default BeerList;