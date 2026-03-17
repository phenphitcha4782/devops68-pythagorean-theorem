const express = require('express');
const app = express();


app.get('/calculate', (req, res) => {
  const { a, b } = req.query;
  if (!a || !b) return res.status(400).json({ error: 'Missing a or b parameter' });
  
  const side1 = parseFloat(a);
  const side2 = parseFloat(b);
  if (isNaN(side1) || isNaN(side2)) return res.status(400).json({ error: 'a and b must be numbers' });
  
  const hypotenuse = Math.sqrt(side1 * side1 + side2 * side2);
  res.json({ a: side1, b: side2, hypotenuse: Math.round(hypotenuse * 100) / 100 });
});

app.listen(3015, () => console.log('Pythagorean Theorem API on port 3015'));
