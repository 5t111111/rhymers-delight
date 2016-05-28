import React from 'react'
import ReactDOM from 'react-dom'

var LyricBody = React.createClass({
  // componentDidMount: function(event){
  //   App.lyric.preview(document.getElementById('lyric_body').value);
  // },

  handleKeyDown: function(event){
    App.lyric.make_it_rhyme(event.target.value);
  },

  render: function(){
    return (
      <div className="form-group">
        <textarea rows="35" id="lyric_body" className="form-control" name="lyric[body]" onKeyDown={this.handleKeyDown} defaultValue={this.props.body}></textarea>
      </div>
    )
  }
});

var Rhyme = React.createClass({
  getInitialState: function(){
    return { text: this.props.body };
  },

  update: function(val){
    this.setState({text: val})
  },

  render: function(){
    return (
      <div className="rhyme" dangerouslySetInnerHTML={{__html: this.state.text}}></div>
    )
  }
});

var RhymeMachine = React.createClass({
  render: function(){
    return (
      <div>
        <LyricBody {...this.props}/>
      </div>
    )
  }
})

export class RhymeEditor {
  constructor (element, props = {}) {
    this.element = element
      this._props = props
  }

  get props () {
    return this._props
  }

  set props (props) {
    Object.assign(this._props, props)
      return this.render()
  }

  render () {
    return ReactDOM.render(
      <RhymeMachine {...this.props} />, this.element
    )
  }
}
