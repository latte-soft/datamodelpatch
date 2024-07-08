return {
    invariant = function(v0, v1)
        if not v0 then
            error(v1 or "Unexpected invariant triggered.");
        end;
    end
};
