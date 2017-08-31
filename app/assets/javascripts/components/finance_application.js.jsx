var FinanceApplication = React.createClass({
    getInitialState() {
        return { stocks: [] }
    },
    getStocks() {
        $.getJSON('/api/v1/stocks.json', (response) => { this.setState({ stocks: response }) });
    },
    componentDidMount() {
      this.getStocks();
    },
    handleSubmit(stock) {
        var newState = this.state.stocks.concat(stock);
        this.setState({ stocks: newState })
    },
    handleDelete() {
        this.getStocks();
    },
    render: function() {
        return(
            <div className="container">
                <div className="jumbotron">
                    <h1>Finance</h1>
                </div>
                <div className="row">
                    <Dropdown id='myDropdown'
                    options={this.state.stocks}
                    handleSubmit={this.handleSubmit}
                    handleDelete={this.handleDelete}
                    valueField='id'
                    />
                </div>
                <div className="row">
                    Table
                </div>
            </div>
        )
    }
});