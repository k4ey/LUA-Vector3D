local Vector3D = {}

function Vector3D:new(x,y,z)
    local vector= {x=x, y=y, z=z}
    setmetatable(vector, self)
    self.__index = self
    return vector
end

function Vector3D:add(...)
    local args = {...}
    if #args == 1 and type(args[1]) == "table" then
        local v = args[1]
        return Vector3D:new(self.x + v.x, self.y + v.y, self.z + v.z )
    elseif #args == 3 and type(args[1]) == "number" and type(args[2]) == "number" and type(args[3]) == "number" then
        local x,y,z = table.unpack(args)
        return Vector3D:new(self.x + x, self.y + y, self.z + z)
    end
end

function Vector3D:sub(...)
    local args = {...}
    if #args == 1 and type(args[1]) == "table" then
        local v = args[1]
        return Vector3D:new(self.x - v.x, self.y - v.y, self.z - v.z )
    elseif #args == 3 and type(args[1]) == "number" and type(args[2]) == "number" and type(args[3]) == "number" then
        local x,y,z = table.unpack(args)
        return Vector3D:new(self.x - x, self.y - y, self.z - z)
    end
end

function Vector3D:normalized()
    local len = math.sqrt(self.x^2 + self.y^2 + self.z^2 )
    return Vector3D:new(self.x / len, self.y / len, self.z / len)
end

function Vector3D:dot(v)
    return self.x * v.x + self.y + v.y + self.z * v.z
end

function Vector3D:cross(v)
    return Vector3D:new(self.y * v.z - self.z * v.y, self.z * v.x - self.x * v.z, self.x * v.y - self.y * v.x);
end

function Vector3D:mul(m)
    return Vector3D:new( self.x * m, self.y * m, self.z * m);
end

function Vector3D:div(d)
    return Vector3D:new( self.x / d, self.y / d, self.z / d);
end

function Vector3D:lenght()
    return math.sqrt( self.x^2 + self.y^2  + self.z^2);
end

function Vector3D:sadd(...)
    local args = {...}
    if #args == 1 and type(args[1]) == "table" then
        local v = args[1]
        self.x = self.x + v.x
        self.y = self.y + v.y
        self.z = self.z + v.z
        return self
    elseif #args == 3 and type(args[1]) == "number" and type(args[2]) == "number" and type(args[3]) == "number" then
        local x,y,z = table.unpack(args)
        self.x = self.x + x
        self.y = self.y + y
        self.z = self.z + z
        return self
    end
end

function Vector3D:ssub(...)
    local args = {...}
    if #args == 1 and type(args[1]) == "table" then
        local v = args[1]
        self.x = self.x - v.x
        self.y = self.y - v.y
        self.z = self.z - v.z
        return self
    elseif #args == 3 and type(args[1]) == "number" and type(args[2]) == "number" and type(args[3]) == "number" then
        local x,y,z = table.unpack(args)
        self.x = self.x - x
        self.y = self.y - y
        self.z = self.z - z
        return self
    end
end

function Vector3D:snormalize()
    local len = math.sqrt(self.x^2 + self.y^2 + self.z^2 )
    self.x = self.x / len
    self.y = self.y / len
    self.z = self.z / len
    return self
end

function Vector3D:scross(v)
    self.x = self.y * v.z - self.z * v.y;
    self.y = self.z * v.x - self.x * v.z;
    self.z = self.x * v.y - self.y * v.x;
    return self
end

function Vector3D:smul(m)
    self.x = self.x * m
    self.y = self.y * m
    self.z = self.z * m
    return self
end

function Vector3D:sdiv(d)
    self.x = self.x / d
    self.y = self.y / d
    self.z = self.z / d
    return self
end

function Vector3D:toString()
    return ("(X: %d Y: %d Z: %d)"):format(self.x,self.y,self.z)
end
