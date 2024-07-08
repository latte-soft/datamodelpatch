local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local _ = require(l_Parent_0.jsutils.invariant).invariant;
local l_GraphQLSchema_0 = require(l_Parent_0.type.schema).GraphQLSchema;
local l_GraphQLString_0 = require(l_Parent_0.type.scalars).GraphQLString;
local v7 = require(l_Parent_0.type.definition);
local l_GraphQLList_0 = v7.GraphQLList;
local l_GraphQLNonNull_0 = v7.GraphQLNonNull;
local l_GraphQLEnumType_0 = v7.GraphQLEnumType;
local l_GraphQLInterfaceType_0 = v7.GraphQLInterfaceType;
local l_GraphQLObjectType_0 = v7.GraphQLObjectType;
local v13 = require(script.Parent.starWarsData);
local l_getFriends_0 = v13.getFriends;
local l_getHero_0 = v13.getHero;
local l_getHuman_0 = v13.getHuman;
local l_getDroid_0 = v13.getDroid;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = l_GraphQLEnumType_0.new({
    name = "Episode", 
    description = "One of the films in the Star Wars Trilogy", 
    values = l_Map_0.new({
        {
            "NEW_HOPE", 
            {
                value = 4, 
                description = "Released in 1977."
            }
        }, 
        {
            "EMPIRE", 
            {
                value = 5, 
                description = "Released in 1980."
            }
        }, 
        {
            "JEDI", 
            {
                value = 6, 
                description = "Released in 1983."
            }
        }
    })
});
v18 = l_GraphQLInterfaceType_0.new({
    name = "Character", 
    description = "A character in the Star Wars Trilogy", 
    fields = function()
        return l_Map_0.new({
            {
                "id", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
                    description = "The id of the character."
                }
            }, 
            {
                "name", 
                {
                    type = l_GraphQLString_0, 
                    description = "The name of the character."
                }
            }, 
            {
                "friends", 
                {
                    type = l_GraphQLList_0.new(v18), 
                    description = "The friends of the character, or an empty list if they have none."
                }
            }, 
            {
                "appearsIn", 
                {
                    type = l_GraphQLList_0.new(v21), 
                    description = "Which movies they appear in."
                }
            }, 
            {
                "secretBackstory", 
                {
                    type = l_GraphQLString_0, 
                    description = "All secrets about their past."
                }
            }
        });
    end, 
    resolveType = function(v22)
        if v22.type == "Human" then
            return v19.name;
        elseif v22.type == "Droid" then
            return v20.name;
        else
            assert(false);
            return ;
        end;
    end
});
v19 = l_GraphQLObjectType_0.new({
    name = "Human", 
    description = "A humanoid creature in the Star Wars universe.", 
    fields = function()
        return l_Map_0.new({
            {
                "id", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
                    description = "The id of the human."
                }
            }, 
            {
                "name", 
                {
                    type = l_GraphQLString_0, 
                    description = "The name of the human."
                }
            }, 
            {
                "friends", 
                {
                    type = l_GraphQLList_0.new(v18), 
                    description = "The friends of the human, or an empty list if they have none.", 
                    resolve = function(v23)
                        return l_getFriends_0(v23);
                    end
                }
            }, 
            {
                "appearsIn", 
                {
                    type = l_GraphQLList_0.new(v21), 
                    description = "Which movies they appear in."
                }
            }, 
            {
                "homePlanet", 
                {
                    type = l_GraphQLString_0, 
                    description = "The home planet of the human, or null if unknown."
                }
            }, 
            {
                "secretBackstory", 
                {
                    type = l_GraphQLString_0, 
                    description = "Where are they from and how they came to be who they are.", 
                    resolve = function()
                        error(l_Error_0("secretBackstory is secret."));
                    end
                }
            }
        });
    end, 
    interfaces = {
        v18
    }
});
v20 = l_GraphQLObjectType_0.new({
    name = "Droid", 
    description = "A mechanical creature in the Star Wars universe.", 
    fields = function()
        return l_Map_0.new({
            {
                "id", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
                    description = "The id of the droid."
                }
            }, 
            {
                "name", 
                {
                    type = l_GraphQLString_0, 
                    description = "The name of the droid."
                }
            }, 
            {
                "friends", 
                {
                    type = l_GraphQLList_0.new(v18), 
                    description = "The friends of the droid, or an empty list if they have none.", 
                    resolve = function(v24)
                        return l_getFriends_0(v24);
                    end
                }
            }, 
            {
                "appearsIn", 
                {
                    type = l_GraphQLList_0.new(v21), 
                    description = "Which movies they appear in."
                }
            }, 
            {
                "secretBackstory", 
                {
                    type = l_GraphQLString_0, 
                    description = "Construction date and the name of the designer.", 
                    resolve = function()
                        error(l_Error_0("secretBackstory is secret."));
                    end
                }
            }, 
            {
                "primaryFunction", 
                {
                    type = l_GraphQLString_0, 
                    description = "The primary function of the droid."
                }
            }
        });
    end, 
    interfaces = {
        v18
    }
});
return {
    StarWarsSchema = l_GraphQLSchema_0.new({
        query = l_GraphQLObjectType_0.new({
            name = "Query", 
            fields = function()
                return l_Map_0.new({
                    {
                        "hero", 
                        {
                            type = v18, 
                            args = {
                                episode = {
                                    description = "If omitted, returns the hero of the whole saga. If provided, returns the hero of that particular episode.", 
                                    type = v21
                                }
                            }, 
                            resolve = function(_, v26)
                                return l_getHero_0(v26.episode);
                            end
                        }
                    }, 
                    {
                        "human", 
                        {
                            type = v19, 
                            args = {
                                id = {
                                    description = "id of the human", 
                                    type = l_GraphQLNonNull_0.new(l_GraphQLString_0)
                                }
                            }, 
                            resolve = function(_, v28)
                                return l_getHuman_0(v28.id);
                            end
                        }
                    }, 
                    {
                        "droid", 
                        {
                            type = v20, 
                            args = {
                                id = {
                                    description = "id of the droid", 
                                    type = l_GraphQLNonNull_0.new(l_GraphQLString_0)
                                }
                            }, 
                            resolve = function(_, v30)
                                return l_getDroid_0(v30.id);
                            end
                        }
                    }
                });
            end
        }), 
        types = {
            v19, 
            v20
        }
    })
};
