local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Packages.Promise);
local v5 = v1.interface({
    previousResult = v1.optional(v1.any), 
    isResolveConditionMet = v1.callback, 
    retryCallback = v1.callback, 
    retryCount = v1.number, 
    retryTimeMultiplier = v1.number, 
    waitImpl = v1.callback
});
local function v6(v7)
    local l_retryCount_0 = v7.retryCount;
    local l_previousResult_0 = v7.previousResult;
    local l_isResolveConditionMet_0 = v7.isResolveConditionMet;
    local l_retryCallback_0 = v7.retryCallback;
    local l_retryTimeMultiplier_0 = v7.retryTimeMultiplier;
    local l_waitImpl_0 = v7.waitImpl;
    if not l_isResolveConditionMet_0(l_previousResult_0) then
        return v4.new(function(v14, _)
            coroutine.wrap(function()
                l_waitImpl_0(l_retryTimeMultiplier_0 * math.pow(2, l_retryCount_0 - 1));
                v14();
            end)();
        end):andThen(function()
            return l_retryCallback_0();
        end):andThen(function(v16)
            if l_retryCount_0 > 1 then
                return v6(v2.Dictionary.join(v7, {
                    retryCount = l_retryCount_0 - 1, 
                    previousResult = v16
                }));
            else
                return v4.reject();
            end;
        end);
    else
        return v4.resolve(l_previousResult_0);
    end;
end;
return function(v17)
    v3.assert(v5(v17));
    return v6(v17);
end;
