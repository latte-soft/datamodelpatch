local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(l_Parent_0.Shared).ReactSymbols.REACT_FORWARD_REF_TYPE;
local _ = nil;
return {
    resolveFunctionForHotReloading = function(v5)
        if not _G.__DEV__ then
            return v5;
        else
            return v5;
        end;
    end, 
    resolveClassForHotReloading = function(v6)
        if not _G.__DEV__ then
            return v6;
        else
            return v6;
        end;
    end, 
    resolveForwardRefForHotReloading = function(v7)
        if not _G.__DEV__ then
            return v7;
        else
            return v7;
        end;
    end, 
    isCompatibleFamilyForHotReloading = function(_, _)
        warn("isCompatibleFamilyForHotReloading is stubbed (returns false)");
        return false;
    end, 
    markFailedErrorBoundaryForHotReloading = function(_)
        if not _G.__DEV__ then
            return ;
        else
            return ;
        end;
    end
};
