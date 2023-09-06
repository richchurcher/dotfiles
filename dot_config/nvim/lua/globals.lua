-- courtesy TJ DeVries: https://youtu.be/n4Lp4cV8YR0?si=eze42Q6ZYYmmZP6i&t=2105
P = function(v)
    print(vim.inspect(v))
    return v
end

RELOAD = function(...)
    return require("plenary.reload").reload_module(...)
end

R = function(name)
    RELOAD(name)
    return require(name)
end
