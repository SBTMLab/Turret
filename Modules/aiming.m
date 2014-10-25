function [out1, out2] = aiming (hpos,vpos,target,ap)

diff = target - ap;

hk = 10;
vk = 10;

rhpos = diff(1)/hk + hpos*180;
rvpos = diff(2)/vk + vpos*180;

if rhpos > 150
    rhpos = 150;

elseif rhpos < 30 
    rhpos = 30;

end

if rvpos > 150
    rvpos = 150;
    
elseif rvpos <30
    rvpos = 30;
end

out1 = rhpos/180;
out2 = rvpos/180;
