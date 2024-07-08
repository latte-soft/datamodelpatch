local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v3 = require(l_Parent_0.Promise);
local v4 = {
    type = "Human", 
    id = "1000", 
    name = "Luke Skywalker", 
    friends = {
        "1002", 
        "1003", 
        "2000", 
        "2001"
    }, 
    appearsIn = {
        4, 
        5, 
        6
    }, 
    homePlanet = "Tatooine"
};
local v5 = {
    type = "Human", 
    id = "1001", 
    name = "Darth Vader", 
    friends = {
        "1004"
    }, 
    appearsIn = {
        4, 
        5, 
        6
    }, 
    homePlanet = "Tatooine"
};
local v6 = {
    type = "Human", 
    id = "1002", 
    name = "Han Solo", 
    friends = {
        "1000", 
        "1003", 
        "2001"
    }, 
    appearsIn = {
        4, 
        5, 
        6
    }
};
local v7 = {
    type = "Human", 
    id = "1003", 
    name = "Leia Organa", 
    friends = {
        "1000", 
        "1002", 
        "2000", 
        "2001"
    }, 
    appearsIn = {
        4, 
        5, 
        6
    }, 
    homePlanet = "Alderaan"
};
local v8 = {
    type = "Human", 
    id = "1004", 
    name = "Wilhuff Tarkin", 
    friends = {
        "1001"
    }, 
    appearsIn = {
        4
    }
};
local v9 = {
    [v4.id] = v4, 
    [v5.id] = v5, 
    [v6.id] = v6, 
    [v7.id] = v7, 
    [v8.id] = v8
};
local v10 = {
    type = "Droid", 
    id = "2000", 
    name = "C-3PO", 
    friends = {
        "1000", 
        "1002", 
        "1003", 
        "2001"
    }, 
    appearsIn = {
        4, 
        5, 
        6
    }, 
    primaryFunction = "Protocol"
};
local v11 = {
    type = "Droid", 
    id = "2001", 
    name = "R2-D2", 
    friends = {
        "1000", 
        "1002", 
        "1003"
    }, 
    appearsIn = {
        4, 
        5, 
        6
    }, 
    primaryFunction = "Astromech"
};
local v12 = {
    [v10.id] = v10, 
    [v11.id] = v11
};
local function v14(v13)
    return v3.resolve(v9[v13] or v12[v13]);
end;
return {
    getHuman = function(v15)
        return v9[v15];
    end, 
    getCharacter = v14, 
    getDroid = function(v16)
        return v12[v16];
    end, 
    getFriends = function(v17)
        return l_Array_0.map(v17.friends, function(v18)
            return v14(v18);
        end);
    end, 
    getHero = function(v19)
        if v19 == 5 then
            return v4;
        else
            return v11;
        end;
    end
};
