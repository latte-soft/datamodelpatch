return function(v0)
    assert(typeof(v0) == "table");
    assert(typeof(v0.start) == "function");
    assert(typeof(v0.stop) == "function");
    assert(typeof(v0.step) == "function");
    assert(typeof(v0.setGoal) == "function");
    assert(typeof(v0.onStep) == "function");
    assert(typeof(v0.onComplete) == "function");
    assert(typeof(v0.destroy) == "function");
end;
