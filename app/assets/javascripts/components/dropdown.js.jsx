var Dropdown = React.createClass({

    propTypes: {
        id: React.PropTypes.string.isRequired,
        options: React.PropTypes.array.isRequired,
        value: React.PropTypes.oneOfType(
            [
                React.PropTypes.number,
                React.PropTypes.string
            ]
        ),
        valueField: React.PropTypes.string,
        labelField: React.PropTypes.string,
        onChange: React.PropTypes.func
    },

    getDefaultProps: function() {
        return {
            value: null,
            valueField: 'value',
            labelField: 'label',
            onChange: null
        };
    },

    getInitialState: function() {
        var selected = this.getSelectedFromProps(this.props);
        return {
            selected: selected
        }
    },

    componentWillReceiveProps: function(nextProps) {
        var selected = this.getSelectedFromProps(nextProps);
        this.setState({
            selected: selected
        });
    },

    getSelectedFromProps(props) {
        var selected;
        if (props.value === null && props.options.length !== 0) {
            selected = props.options[0][props.valueField];
        } else {
            selected = props.value;
        }
        return selected;
    },
    handleClick() {
        var name = this.refs.name.value;
        $.ajax({
            url: '/api/v1/items',
            type: 'POST',
            data: { item: { name: name, description: description } },
            success: (item) => {
                this.props.handleSubmit(item);
            }
        });
    },
    render: function() {
        var self = this;
        var options = self.props.options.map(function(option) {
            return (
                <option key={option.id} value={option.id}>
                    {option.name}
                </option>
            )
        });
        return (
            <div>
                <div className="col-md-4">
                    <select id={this.props.id}
                            className='form-control'
                            value={this.state.selected}
                            onChange={this.handleChange}>
                        {options}
                    </select>
                </div>
                <div className="col-md-4">
                    <div>
                        <input ref='name' id="name" placeholder='Enter new stock symbol' />
                        <button onClick={this.handleClick}>Add</button>
                    </div>
                </div>
                <div className="col-md-1">
                    <button>Del</button>
                </div>
            </div>
        )
    },

    handleChange: function(e) {
        if (this.props.onChange) {
            var change = {
                oldValue: this.state.selected,
                newValue: e.target.value
            }
            this.props.onChange(change);
        }
        this.setState({selected: e.target.value});
    }

});