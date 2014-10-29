function [out1, out2] = aiming (hpos,vpos,target,ap)

diff = target - ap;

hk = 30;
vk = 50;

rhpos = -diff(1)/hk + hpos*180;
rvpos = -diff(2)/vk + vpos*180;

if rhpos > 150
    rhpos = 150;

elseif rhpos < 30 
    rhpos = 30;

end

if rvpos > 117
    rvpos = 117;
    
elseif rvpos <45
    rvpos = 45;
end

out1 = rhpos/180;
out2 = rvpos/180;
