require('dotenv').config();

const express = require('express');
const router = require('./app/router');

const app = express();
const menuMiddleware=require('./app/middlewares/menuMiddleware');

const PORT = process.env.PORT || 4000;

app.set('view engine', 'ejs');
app.set('views', './app/views');

app.use(express.static('./public'));

app.use(express.urlencoded({
    extended: true
}));

app.use(menuMiddleware);
app.use(router);

app.listen(PORT, () => {
    console.log(`Server started on port ${PORT}`);
});