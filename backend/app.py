from flask import Flask, request, jsonify
from flask_cors import CORS
 
app = Flask(__name__)
CORS(app)
 
@app.route('/process', methods=['POST'])
def process_text():
    data = request.json
    if not data or 'text' not in data:
        return jsonify({'error': 'No text provided'}), 400

    input_text = data['text']
    processed_text = input_text.upper()  # 简单处理：将文本转换为大写

    return jsonify({'processed_text': processed_text})

@app.route('/test', methods=['GET'])
def get_test():
    return "asd"
 
if __name__ == '__main__':
    app.run(debug=True)