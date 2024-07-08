local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_0.SelectedUsersContext);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Cryo);
local l_dependencyArray_0 = require(l_Parent_1.RoactUtils).Hooks.dependencyArray;
return function(v6)
    local v7 = v3.useRef(0);
    local v8, v9 = v3.useState({});
    local v10, v11 = v3.useState(0);
    local v14 = v3.useCallback(function(v12, v13)
        if v10 < 5 then
            v9(v4.Dictionary.join(v8, {
                [v12] = {
                    displayName = v13, 
                    layoutOrder = v7.current
                }
            }));
            v7.current = v7.current + 1;
            v11(v10 + 1);
        end;
    end, l_dependencyArray_0(v8));
    local v16 = v3.useCallback(function(v15)
        v9(v4.Dictionary.join(v8, {
            [v15] = v4.None
        }));
        v11(v10 - 1);
    end, l_dependencyArray_0(v8));
    local v18 = v3.useCallback(function(v17)
        return v8[v17] or false;
    end, l_dependencyArray_0(v8));
    return v3.createElement(v2.Provider, {
        value = v3.useMemo(function()
            return {
                selectedFriendsSize = v10, 
                selectedFriends = v8, 
                addFriend = v14, 
                removeFriend = v16, 
                isFriendSelected = v18
            };
        end, l_dependencyArray_0(v8, v14, v16, v18))
    }, v6.children);
end;
