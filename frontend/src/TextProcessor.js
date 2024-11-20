import React, { useState } from 'react';

function TextProcessor() {
  const [inputText, setInputText] = useState('');
  const [processedText, setProcessedText] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch('http://127.0.0.1:5000/process', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ text: inputText }),
      });

      const data = await response.json();
      if (response.ok) {
        setProcessedText(data.processed_text);
      } else {
        console.error('Error:', data.error);
      }
    } catch (error) {
      console.error('Request failed:', error);
    }
  };

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          value={inputText}
          onChange={(e) => setInputText(e.target.value)}
          placeholder="Enter text here"
        />
        <button type="submit">Submit</button>
      </form>
      {processedText && (
        <div>
          <h2>Processed Text:</h2>
          <p>{processedText}</p>
        </div>
      )}
    </div>
  );
}

export default TextProcessor;
