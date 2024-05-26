require('dotenv').config();
const express = require('express');
const app = express();
const path = require('path');
const PORT = process.env.PORT || 5000;

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views')); 
// app.use(express.static(path.join(__dirname)));
app.use('/public', express.static(path.join(__dirname, 'public')));


app.get('/', (req, res) => {
    res.render('home.ejs');
})


// app.listen(PORT, () => {
//     console.log(`Server is running on http://localhost:${PORT}`);
// });

app.listen(PORT, function (err) {
    if (err) console.log(err);
    console.log(`Server is running on http://localhost:${PORT}`);
});

