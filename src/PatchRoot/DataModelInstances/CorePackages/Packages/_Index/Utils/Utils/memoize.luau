local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Boolean_0 = v0.Boolean;
local l_WeakMap_0 = v0.WeakMap;
local v68 = {
    memoize1 = function(v3)
        local v4 = l_WeakMap_0.new();
        return function(v5)
            local v6 = v4:get(v5);
            if v6 == nil then
                local v7 = v3(v5);
                v4:set(v5, v7);
                return v7;
            else
                return v6;
            end;
        end;
    end, 
    memoize2 = function(v8)
        local v9 = l_WeakMap_0.new();
        return function(v10, v11)
            local v12 = v9:get(v10);
            if l_Boolean_0.toJSBoolean(v12) then
                local v13 = v12:get(v11);
                if v13 == nil then
                    local v14 = v8(v10, v11);
                    v12:set(v11, v14);
                    return v14;
                else
                    return v13;
                end;
            else
                v12 = l_WeakMap_0.new();
                v9:set(v10, v12);
                local v15 = v8(v10, v11);
                v12:set(v11, v15);
                return v15;
            end;
        end;
    end, 
    memoize3 = function(v16)
        local v17 = l_WeakMap_0.new();
        return function(v18, v19, v20)
            local v21 = v17:get(v18);
            if l_Boolean_0.toJSBoolean(v21) then
                local v22 = v21:get(v19);
                if l_Boolean_0.toJSBoolean(v22) then
                    local v23 = v22:get(v20);
                    if v23 == nil then
                        local v24 = v16(v18, v19, v20);
                        v22:set(v20, v24);
                        return v24;
                    else
                        return v23;
                    end;
                else
                    v22 = l_WeakMap_0.new();
                    v21:set(v19, v22);
                    local v25 = v16(v18, v19, v20);
                    v22:set(v20, v25);
                    return v25;
                end;
            else
                v21 = l_WeakMap_0.new();
                v17:set(v18, v21);
                local v26 = l_WeakMap_0.new();
                v21:set(v19, v26);
                local v27 = v16(v18, v19, v20);
                v26:set(v20, v27);
                return v27;
            end;
        end;
    end, 
    memoize4 = function(v28)
        local v29 = l_WeakMap_0.new();
        return function(v30, v31, v32, v33)
            local v34 = v29:get(v30);
            if l_Boolean_0.toJSBoolean(v34) then
                local v35 = v34:get(v31);
                if l_Boolean_0.toJSBoolean(v35) then
                    local v36 = v35:get(v32);
                    if l_Boolean_0.toJSBoolean(v36) then
                        local v37 = v36:get(v33);
                        if v37 == nil then
                            local v38 = v28(v30, v31, v32, v33);
                            v36:set(v33, v38);
                            return v38;
                        else
                            return v37;
                        end;
                    else
                        v36 = l_WeakMap_0.new();
                        v35:set(v32, v36);
                        local v39 = v28(v30, v31, v32, v33);
                        v36:set(v33, v39);
                        return v39;
                    end;
                else
                    v35 = l_WeakMap_0.new();
                    v34:set(v31, v35);
                    local v40 = l_WeakMap_0.new();
                    v35:set(v32, v40);
                    local v41 = v28(v30, v31, v32, v33);
                    v40:set(v33, v41);
                    return v41;
                end;
            else
                v34 = l_WeakMap_0.new();
                v29:set(v30, v34);
                local v42 = l_WeakMap_0.new();
                v34:set(v31, v42);
                local v43 = l_WeakMap_0.new();
                v42:set(v32, v43);
                local v44 = v28(v30, v31, v32, v33);
                v43:set(v33, v44);
                return v44;
            end;
        end;
    end, 
    memoize5 = function(v45)
        local v46 = l_WeakMap_0.new();
        return function(v47, v48, v49, v50, v51)
            local v52 = v46:get(v47);
            if l_Boolean_0.toJSBoolean(v52) then
                local v53 = v52:get(v48);
                if l_Boolean_0.toJSBoolean(v53) then
                    local v54 = v53:get(v49);
                    if l_Boolean_0.toJSBoolean(v54) then
                        local v55 = v54:get(v50);
                        if l_Boolean_0.toJSBoolean(v55) then
                            local v56 = v55:get(v51);
                            if v56 == nil then
                                local v57 = v45(v47, v48, v49, v50, v51);
                                v55:set(v51, v57);
                                return v57;
                            else
                                return v56;
                            end;
                        else
                            v55 = l_WeakMap_0.new();
                            v54:set(v50, v55);
                            local v58 = v45(v47, v48, v49, v50, v51);
                            v55:set(v51, v58);
                            return v58;
                        end;
                    else
                        v54 = l_WeakMap_0.new();
                        v53:set(v49, v54);
                        local v59 = l_WeakMap_0.new();
                        v54:set(v50, v59);
                        local v60 = v45(v47, v48, v49, v50, v51);
                        v59:set(v51, v60);
                        return v60;
                    end;
                else
                    v53 = l_WeakMap_0.new();
                    v52:set(v48, v53);
                    local v61 = l_WeakMap_0.new();
                    v53:set(v49, v61);
                    local v62 = l_WeakMap_0.new();
                    v61:set(v50, v62);
                    local v63 = v45(v47, v48, v49, v50, v51);
                    v62:set(v51, v63);
                    return v63;
                end;
            else
                v52 = l_WeakMap_0.new();
                v46:set(v47, v52);
                local v64 = l_WeakMap_0.new();
                v52:set(v48, v64);
                local v65 = l_WeakMap_0.new();
                v64:set(v49, v65);
                local v66 = l_WeakMap_0.new();
                v65:set(v50, v66);
                local v67 = v45(v47, v48, v49, v50, v51);
                v66:set(v51, v67);
                return v67;
            end;
        end;
    end
};
local v69 = l_WeakMap_0.new();
v68.memoize2of4 = function(v70)
    return function(v71, v72, v73, v74)
        local v75 = v69:get(v71);
        if l_Boolean_0.toJSBoolean(v75) then
            local v76 = v75:get(v72);
            if v76 == nil then
                local v77 = v70(v71, v72, v73, v74);
                v75:set(v72, v77);
                return v77;
            else
                return v76;
            end;
        else
            v75 = l_WeakMap_0.new();
            v69:set(v71, v75);
            local v78 = v70(v71, v72, v73, v74);
            v75:set(v72, v78);
            return v78;
        end;
    end;
end;
return v68;
