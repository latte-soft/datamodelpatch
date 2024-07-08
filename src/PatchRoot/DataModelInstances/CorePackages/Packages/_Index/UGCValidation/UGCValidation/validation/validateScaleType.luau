local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v2 = require(l_Parent_0.flags.getFFlagUGCValidateAccessoriesScaleType);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.Analytics);
return function(v5)
    if v2() then
        if v5 then
            if v3.AvatarPartScaleTypes[v5.Value] then
                return true;
            else
                v4.reportFailure(v4.ErrorType.validateScaleType_InvalidAvatarPartScaleType);
                assert(v5.Parent);
                if not v1() then
                    return false, {
                        (("%*.%*.Value must be either Classic, ProportionsSlender, or ProportionsNormal"):format(v5.Parent.Name, v5.Name))
                    };
                else
                    return false, {
                        string.format("The AvatarPartScaleType value in '%s' is invalid. Please, verify the value you are using is either Classic, ProportionsSlender, or ProportionsNormal.", v5.Parent.Name)
                    };
                end;
            end;
        else
            return true;
        end;
    else
        return true;
    end;
end;
