local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.Parent.Promise);
local v3 = require(l_Parent_0.AwardProtocolConstants);
local _ = require(l_Parent_0.AwardProtocolTypes);
local v5 = {};
v5.__index = v5;
v5.new = function()
    return (setmetatable({}, v5));
end;
v5.isAvailable = function(_)
    return (v2.new(function(v7, _)
        l_MessageBusService_0:MakeRequest(v3.NAME, v3.METHOD_IS_AVAILABLE, {}, function(v9)
            v7(v9.isAvailable);
        end, {});
    end));
end;
v5.hasAchievedAward = function(_, v11)
    return (v2.new(function(v12, _)
        l_MessageBusService_0:MakeRequest(v3.NAME, v3.METHOD_HAS_ACHIEVED_AWARD, {
            awardName = v11
        }, function(v14)
            v12(v14.hasAward);
        end, {});
    end));
end;
v5.hasAchievedAllAwards = function(_)
    return (v2.new(function(v16, _)
        l_MessageBusService_0:MakeRequest(v3.NAME, v3.METHOD_HAS_ACHIEVED_ALL_AWARDS, {}, function(v18)
            v16(v18.hasAchievedAllAwards);
        end, {});
    end));
end;
v5.hasAchievedAnyAwards = function(_)
    return (v2.new(function(v20, _)
        l_MessageBusService_0:MakeRequest(v3.NAME, v3.METHOD_HAS_ACHIEVED_ANY_AWARDS, {}, function(v22)
            v20(v22.hasAchievedAnyAwards);
        end, {});
    end));
end;
v5.grantAward = function(_, v24)
    return (v2.new(function(v25, _)
        l_MessageBusService_0:MakeRequest(v3.NAME, v3.METHOD_GRANT_AWARD, {
            awardName = v24
        }, function(v27)
            v25(v27.wasAwardGranted);
        end, {});
    end));
end;
v5.default = v5.new();
return v5;
