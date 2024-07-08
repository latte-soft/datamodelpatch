return {
    fromError = require(script.fromError).fromError, 
    toPromise = require(script.toPromise).toPromise, 
    fromPromise = require(script.fromPromise).fromPromise, 
    throwServerError = require(script.throwServerError).throwServerError, 
    validateOperation = require(script.validateOperation).validateOperation, 
    createOperation = require(script.createOperation).createOperation, 
    transformOperation = require(script.transformOperation).transformOperation
};
