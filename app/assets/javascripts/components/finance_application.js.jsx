var options = [
    {
        description: 'This is option A',
        code: 'a'
    },
    {
        description: 'This is option B',
        code: 'b'
    },
    {
        description: 'This is option C',
        code: 'c'
    },
    {
        description: 'This is option D',
        code: 'd'
    }
];


var dropDownOnChange = function(change) {
    alert('onChangeForSelect:\noldValue: ' +
        change.oldValue +
        '\nnewValue: '
        + change.newValue);
};


var FinanceApplication = React.createClass({
    getInitialState() {
        return { stocks: [] }
    },
    componentDidMount() {
        $.getJSON('/api/v1/stocks.json', (response) => { this.setState({ stocks: response }) });
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
                    value='b'
                    onChange={dropDownOnChange}/>
                </div>
                <div className="row">
                    Table
                </div>
            </div>
        )
    }
});