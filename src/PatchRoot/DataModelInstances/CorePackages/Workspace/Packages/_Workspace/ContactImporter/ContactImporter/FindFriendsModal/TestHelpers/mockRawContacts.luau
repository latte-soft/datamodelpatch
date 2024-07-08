local v0 = {};
for v1 = 1, 25 do
    table.insert(v0, {
        phonenumber = {
            (tostring(v1))
        }, 
        lastname = "Person" .. tostring(v1), 
        firstname = "Test" .. tostring(v1)
    });
end;
return {
    shortList = {
        {
            phonenumber = {
                "44 2350328333"
            }, 
            lastname = "a", 
            firstname = "alex"
        }, 
        {
            phonenumber = {
                "980889091"
            }, 
            lastname = "b", 
            firstname = "bob"
        }, 
        {
            phonenumber = {
                "980889090"
            }, 
            lastname = "c", 
            firstname = "cathy"
        }, 
        {
            phonenumber = {
                "980889090"
            }, 
            lastname = "z", 
            firstname = "zack"
        }
    }, 
    longList = v0
};
