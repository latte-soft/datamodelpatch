return {
    Store = require(script.Store), 
    createReducer = require(script.createReducer), 
    combineReducers = require(script.combineReducers), 
    makeActionCreator = require(script.makeActionCreator), 
    loggerMiddleware = require(script.loggerMiddleware).middleware, 
    thunkMiddleware = require(script.thunkMiddleware), 
    makeThunkMiddleware = require(script.makeThunkMiddleware)
};
