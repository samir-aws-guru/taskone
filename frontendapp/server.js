const express = require('express')
const app = express();

app.get('/', (req, res) => {
  res.send('Hello from frontend')
});

var port = process.env.port || 80;
app.listen(port, function() {
  console.log('server started');
});