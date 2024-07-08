return {
    resolveDefaultProps = function(v0, v1)
        if not (v0 and typeof(v0) == "table") or not v0.defaultProps then
            return v1;
        else
            local v2 = table.clone(v1);
            local l_defaultProps_0 = v0.defaultProps;
            for v4, _ in l_defaultProps_0, nil, nil do
                if v2[v4] == nil then
                    v2[v4] = l_defaultProps_0[v4];
                end;
            end;
            return v2;
        end;
    end
};
