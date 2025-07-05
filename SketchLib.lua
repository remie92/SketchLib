local lib={}

function lib.testPrint()
    print("SketchLib testPrint function called")
end


lib.screen = nil
lib.yRatio=8/11

function lib.setMonitor(monitor)

    if monitor == nil then
        error("Monitor cannot be nil")
    end
    scale=0.5
    lib.screen = monitor
    lib.screen.setTextScale(math.max(math.min(scale,5),0.5))
    -- Clear the monitor
    lib.background(colors.gray)
    
    local width, height = lib.screen.getSize()
    print("Monitor size: " .. width .. "x" .. height/lib.yRatio)
end

function lib.testDraw()
    if lib.screen == nil then
        error("Monitor not set. Call setMonitor first.")
    end

    lib.background(colors.gray)

    lib.rect(2,3,20,20,colors.red)
end

function lib.background(col)
    lib.screen.setBackgroundColor(col)
    lib.screen.clear()
end

lib.strokeWeight=1
lib.strokeColor=colors.black
lib.doStroke=true
lib.doFill=true
lib.fillColor=colors.white


function lib.stroke(col)
    lib.doStroke=true
    lib.strokeColor = col
end

function lib.noStroke()
    lib.doStroke=false
end

function lib.setStrokeWeight(weight)
    lib.strokeWeight = weight
end

function lib.noFill()
    lib.doFill=false
end

function lib.fill(col)
    lib.doFill=true
    lib.fillColor = col
end


function lib.rect(x, y, w, h)
    if lib.doFill then
        for i = x + 1, x + w - 1 do
            for j = y + 1, y + h - 1 do
                lib.set(i, j, lib.fillColor)
            end
        end
    end

    if lib.doStroke then
        for weight = 1, lib.strokeWeight do
            for i = x, x + w - 1 do
                lib.set(i, y+weight-1, lib.strokeColor)
                lib.set(i, y + h-weight+1, lib.strokeColor)
            end
            for j = y, y + h - 1 do
                lib.set(x+weight-1, j, lib.strokeColor)
                lib.set(x + w-weight+1, j, lib.strokeColor)
            end
        end
    end
end

function lib.circle(x, y, extent)
    if lib.doFill then
       for i=x-extent,x+extent do
            for j=y-extent,y+extent do
                if math.sqrt((i-x)^2+(j-y)^2) <= extent then
                    lib.set(i,j,lib.fillColor)
                end
            end
        end
    end

        if lib.doStroke then
       for i=x-extent,x+extent do
            for j=y-extent,y+extent do
                length=math.sqrt((i-x)^2+(j-y)^2)
                if length <= extent and length>extent-lib.strokeWeight then
                    lib.set(i,j,lib.strokeColor)
                end
            end
        end
    end
end

function lib.set(x,y,textCol)
    lib.screen.setCursorPos(x,math.floor(y*lib.yRatio))
    lib.screen.setBackgroundColor(textCol)
    lib.screen.write(" ")

end



return lib