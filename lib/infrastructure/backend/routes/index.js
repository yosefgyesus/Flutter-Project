const express = require('express');
const router = express.Router();
const signupRouter = require('./signup');
const signinRouter = require('./signin');
const profileRouter = require('./profile');
const adminSignUp=require('./admin');

router.post('/signup', signupRouter);
router.post('/signin', signinRouter);
router.post('/profile', profileRouter);
router.post('/admin', adminSignUp);
router.post('/content');
router.post('/createbookmark');
router.post('/learninggoals/create');
router.delete('content/delete');
router.put('/user/manage');
router.post('/bookmarks/save');
router.delete('/learninggoals/delete')
router.put('/learninggoals/update')
router.put('/content/update');
router.delete('/user/delete');
router.put('/user/update');
router.get('/learninggoals');
router.get('/greetgins')
router.get('/numbers');
router.get('/content/view');
router.get('/vocabulary');
router.post('/vocabularypost')
router.put('/vocabulary/${vocabulary.id}')

module.exports = router;
