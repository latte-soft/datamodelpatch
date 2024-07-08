return {
    deprecate = function(v0, v1, v2)
        return function(...)
            if not v1 then
                warn(("[http] %s deprecated. See documentation at http://requests.paric.xyz/"):format(v2 or "Function"));
            else
                warn(("[http] %s deprecated in version %s. See documentation at http://requests.paric.xyz/"):format(v2, v1 or "Function"));
            end;
            return v0(...);
        end;
    end
};
