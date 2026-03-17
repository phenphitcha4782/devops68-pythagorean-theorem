# Pythagorean Theorem API

Calculate hypotenuse of right triangle.

## Endpoint

### GET `/calculate`

**Parameters:**
- `a` (required): First side
- `b` (required): Second side

**Example Request:**
```
http://localhost:3015/calculate?a=3&b=4
```

**Example Response:**
```json
{
  "a": 3,
  "b": 4,
  "hypotenuse": 5
}
```
