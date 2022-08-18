--BF--

local PYU0 = 120; --BF Y--

local PYD0 = 500; --BF Y DOWNSCROLL--
local OYD0 = 600; --DAD Y DOWNSCROLL--


local PX0 = 400; --BF X--
local PX1 = 520; --BF X--
local PX2 = 640; --BF X--
local PX3 = 755; --BF X--

--DAD--

local OX0 = 20; --DAD X--
local OX1 = 220; --DAD X--
local OX2 = 950; --DAD X--
local OX3 = 1150; --DAD X--

local OYU0 = 20; --DAD Y


-- camera move note --

local xx = 300;
local yy = 450;
local xx2 = 1200;
local yy2 = 480;
local ofs = 20;
local ofs2 = 30;
local followchars = true;
local del = 0;
local del2 = 0;

function onUpdate()

    if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end

    --BF STRUMS

--Y
    for iYU = 0,3 do
        setPropertyFromGroup('playerStrums', iYU, 'y', PYU0);
    end

--X

    for i0X = 0,0 do
        setPropertyFromGroup('playerStrums', i0X, 'x', PX0);
    end
    for i1X = 1,1 do
        setPropertyFromGroup('playerStrums', i1X, 'x', PX1);
    end
    for i2X = 2,2 do
        setPropertyFromGroup('playerStrums', i2X, 'x', PX2);
    end
    for i3X = 3,3 do
        setPropertyFromGroup('playerStrums', i3X, 'x', PX3);
    end

    --DAD STRUMS

--Y

    for iY = 0,3 do
        setPropertyFromGroup('opponentStrums', iY, 'y', OYU0);
    end

--X
    for i4X = 0,0 do
        setPropertyFromGroup('opponentStrums', i4X, 'x', OX0);
    end
    for i5X = 1,1 do
        setPropertyFromGroup('opponentStrums', i5X, 'x', OX1);
    end
    for i6X = 2,2 do
        setPropertyFromGroup('opponentStrums', i6X, 'x', OX2);
    end
    for i7X = 3,3 do
        setPropertyFromGroup('opponentStrums', i7X, 'x', OX3);
    end

--DOWNSCROLL LMAOOO

    if downscroll then
    for PD = 0,3 do
        setPropertyFromGroup('playerStrums', PD, 'y', PYD0);
    end
    for OD = 0,3 do
        setPropertyFromGroup('opponentStrums', OD, 'y', OYD0);
    end
  end
end
function goodNoteHit()
   if getProperty('camera.zoom') < 1 then
      setProperty('camera.zoom', 1);
   end
   if getProperty('health') < 0.2 then
    setProperty('health', health+ 0.022);
    end
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.2 then
        setProperty('health', health- 0.020);
    end
    if getProperty('camera.zoom') < 1 then
        setProperty('camera.zoom', 1);
    end
end

