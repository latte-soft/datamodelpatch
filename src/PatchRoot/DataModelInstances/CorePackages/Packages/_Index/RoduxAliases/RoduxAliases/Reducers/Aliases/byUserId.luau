local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.llama);
local l_Actions_0 = l_Parent_0.Actions;
local v5 = require(l_Actions_0.AliasUpdated);
local v6 = require(l_Actions_0.AliasRemoved);
local v7 = require(l_Actions_0.ReceivedCanShowUserAlias);
local _ = require(l_Parent_0.RoduxAliasesTypes);
local function v11(v9, v10)
    return v3.Dictionary.join(v9, v10);
end;
local function v14(v12, v13)
    return v3.Dictionary.join(v12, {
        _INTERNAL_HIDDEN_DATA = v3.Dictionary.join(v12._INTERNAL_HIDDEN_DATA, v13)
    });
end;
local v15 = {
    ShowUserAlias = true
};
return function(v16)
    local l_aliasNetworking_0 = v16.aliasNetworking;
    return v2.createReducer(v15, {
        [v5.name] = function(v18, v19)
            assert(type(v19.payload.userId) == "string", "Expected userId to be a string");
            assert(type(v19.payload.newAlias) == "string", "Expected newAlias to be a string");
            local v20 = {
                [v19.payload.userId] = v19.payload.newAlias
            };
            if v18.ShowUserAlias or v18.ShowUserAlias == nil then
                return v11(v18, v20);
            else
                return v14(v18, v20);
            end;
        end, 
        [v6.name] = function(v21, v22)
            assert(type(v22.payload.userId) == "string", "Expected userId to be a string");
            local v23 = {
                [v22.payload.userId] = v3.None
            };
            if v21.ShowUserAlias or v21.ShowUserAlias == nil then
                return v11(v21, v23);
            else
                return v14(v21, v23);
            end;
        end, 
        [v7.name] = function(v24, v25)
            assert(type(v25.payload.showUserAlias) == "boolean", "Expected showUserAlias to be a boolean");
            if v25.payload.showUserAlias == v24.ShowUserAlias then
                return v24;
            elseif not v25.payload.showUserAlias then
                return {
                    ShowUserAlias = v25.payload.showUserAlias, 
                    _INTERNAL_HIDDEN_DATA = v3.Dictionary.join(v24, {
                        ShowUserAlias = v3.None, 
                        _INTERNAL_HIDDEN_DATA = v3.None
                    })
                };
            else
                return v3.Dictionary.join(v24._INTERNAL_HIDDEN_DATA or {}, {
                    ShowUserAlias = v25.payload.showUserAlias, 
                    _INTERNAL_HIDDEN_DATA = v3.None
                });
            end;
        end, 
        [l_aliasNetworking_0.GetTagsFromUserIds.Succeeded.name] = function(v26, v27)
            local v28 = {};
            for _, v30 in ipairs(v27.responseBody) do
                v28[tostring(v30.targetUserId)] = v30.targetUserTag;
            end;
            if v26.ShowUserAlias or v26.ShowUserAlias == nil then
                return v11(v26, v28);
            else
                return v14(v26, v28);
            end;
        end, 
        [l_aliasNetworking_0.SetUserTag.Succeeded.name] = function(v31, v32)
            return v3.Dictionary.join(v31, {
                [tostring(v32.postBody.targetUserId)] = v32.postBody.userTag
            });
        end
    });
end;
