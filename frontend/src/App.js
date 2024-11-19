import React, { useEffect, useState } from 'react';
import './App.css';
 
function App() {
  const [strategies, setStrategies] = useState([]);
  useEffect(() => {
    fetch('http://localhost:5000/strategies')
      .then(response => response.json())
      .then(data => setStrategies(data));
  }, []); 
  return (
    <div>
      <h1>Quant Trading Strategies</h1>
      <ul>
        {strategies.map(strategy => (
          <li key={strategy.id}>{strategy.name}</li>
        ))}
      </ul>
    </div>
  );
}

export default App;
