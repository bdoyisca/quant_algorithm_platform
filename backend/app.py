from flask import Flask, jsonify
 
app = Flask(__name__)
 
@app.route('/strategies', methods=['GET'])
def get_strategies():
    strategies = [
        {"id": 1, "name": "Momentum Strategy"},
        {"id": 2, "name": "Mean Reversion Strategy"}
    ]
    return jsonify(strategies)

@app.route('/test', methods=['GET'])
def get_test():
    return "asd"
 
if __name__ == '__main__':
    app.run(debug=True)