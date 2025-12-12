require('dotenv').config();
const express = require('express');
const session = require('express-session');
const methodOverride = require('method-override');
const path = require('path');
const db = require('./models');

const app = express();
const PORT = 3000;

// Body parser
app.use(express.urlencoded({ extended: true }));

// Static
app.use(express.static(path.join(__dirname, 'public')));

// METHOD OVERRIDE HARUS SEBELUM ROUTES
app.use(methodOverride('_method'));

// Session
app.use(session({
  secret: 'a_very_secret_key_that_is_long_and_random',
  resave: false,
  saveUninitialized: false,
}));

// Make `user` available in all views (avoid undefined variable in EJS)
app.use((req, res, next) => {
  res.locals.user = req.session ? req.session.user : null;
  next();
});

// View engine
app.set('view engine', 'ejs');

// Debugging request
app.use((req, res, next) => {
  console.log(`Request: ${req.method} ${req.originalUrl}`);
  next();
});

// Routes
app.use('/', require('./routes/auth'));
app.use('/', require('./routes/dashboard'));
app.use('/users', require('./routes/users'));
app.use('/customers', require('./routes/customers'));
app.use('/projects', require('./routes/projects'));

// db.sequelize.sync().then(() => {
db.sequelize.sync({ alter: true }).then(async () => {
  app.listen(PORT, () =>
    console.log(`Server running at http://localhost:${PORT}`)
  );
});
