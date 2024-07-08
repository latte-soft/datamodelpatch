local l_Parent_0 = script:FindFirstAncestor("CommunityLinks").Parent;
local v1 = require(l_Parent_0.Promise);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local v3 = require(script.Parent.Parent.Actions.SetExperienceCommunityLink);
local v4 = require(script.Parent.Parent.Requests.GetCommunityLink);
local v5 = require(script.Parent.Parent.Models.CommunityInfo);
local v6 = require(script.Parent.Parent.Enums.CommunityVisibility);
return function(v7, v8)
    return function(v9)
        return v4(v7, v8):andThen(function(v10)
            if v10.responseBody ~= nil and v10.responseBody.communityId ~= nil then
                local v11 = v5.fromJsonData(v10.responseBody);
                if v11.visibility == v6.Public then
                    v9:dispatch(v3(v8, v11));
                    return ;
                end;
            end;
            v9:dispatch(v3(v8, false));
        end, function(v12)
            if v12.StatusCode == l_StatusCodes_0.NOT_FOUND then
                v9:dispatch(v3(v8, false));
            end;
            return v1.resolve();
        end);
    end;
end;
