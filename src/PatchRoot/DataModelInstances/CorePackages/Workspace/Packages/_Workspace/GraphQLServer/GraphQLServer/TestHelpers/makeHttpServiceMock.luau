return function(v0, v1)
    return {
        RequestInternal = function(_)
            return {
                Start = function(_, v4)
                    v4(v0, v1);
                end
            };
        end
    };
end;
