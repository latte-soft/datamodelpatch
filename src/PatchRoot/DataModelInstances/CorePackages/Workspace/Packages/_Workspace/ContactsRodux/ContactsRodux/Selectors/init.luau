return function(v0)
    return {
        sortContacts = require(script.sortContacts)(v0), 
        getPhoneNumber = require(script.getPhoneNumber)
    };
end;
